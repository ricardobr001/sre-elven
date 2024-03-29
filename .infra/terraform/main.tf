terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.9"

  backend "s3" {
    key    = "gobarber-terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
}

data "external" "my_ip" {
  program = ["/bin/bash", "${path.module}/scripts/whats-my-ip.sh"]
}

variable "RDS_PASSWORD" {
  type = string
}

variable "DOCUMENT_DB_PASSWORD" {
  type = string
}

locals {
  environment    = terraform.workspace
  product        = "gobarber"
  cluster_name   = "gobarber-eks-cluster"
  vpc_cidr_block = "10.30.0.0/16"

  public_az_a_subnet_cidr_block  = "10.30.0.0/24"
  public_az_b_subnet_cidr_block  = "10.30.1.0/24"
  private_az_a_subnet_cidr_block = "10.30.2.0/24"
  private_az_b_subnet_cidr_block = "10.30.3.0/24"
}

module "network" {
  source = "./aws/network"

  environment = local.environment
  product     = local.product

  vpc_cidr_block = local.vpc_cidr_block

  public_az_a_subnet_cidr_block  = local.public_az_a_subnet_cidr_block
  public_az_b_subnet_cidr_block  = local.public_az_b_subnet_cidr_block
  private_az_a_subnet_cidr_block = local.private_az_a_subnet_cidr_block
  private_az_b_subnet_cidr_block = local.private_az_b_subnet_cidr_block
}

module "elasticache" {
  source = "./aws/elasticache"

  environment = local.environment
  product     = local.product

  vpc_id              = module.network.vpc_id
  redis_subnets       = [module.network.private_az_a_subnet_id, module.network.private_az_b_subnet_id]
  private_cidr_blocks = [local.private_az_a_subnet_cidr_block, local.private_az_b_subnet_cidr_block]
}

module "document_db" {
  source = "./aws/document_db"

  my_ip       = format("%s/%s", data.external.my_ip.result["internet_ip"], 32)
  environment = local.environment
  product     = local.product

  vpc_id              = module.network.vpc_id
  private_cidr_blocks = [local.private_az_a_subnet_cidr_block, local.private_az_b_subnet_cidr_block]
  db_subnets          = [module.network.private_az_a_subnet_id, module.network.private_az_b_subnet_id]

  db_password = var.DOCUMENT_DB_PASSWORD
}

module "ecr" {
  source = "./aws/ecr"

  environment = local.environment
  product     = local.product
}

module "loadbalancer" {
  source = "./aws/loadbalancer"

  environment = local.environment
  product     = local.product

  vpc_id                            = module.network.vpc_id
  gobarber_loadbalancer_subnets_ids = [module.network.public_az_a_subnet_id, module.network.public_az_b_subnet_id]
}

module "ecs" {
  source = "./aws/ecs"

  environment = local.environment
  product     = local.product

  ecr_image                      = module.ecr.ecr_image_uri
  vpc_id                         = module.network.vpc_id
  loadbalancer_security_group_id = module.loadbalancer.loadbalancer_security_group_id
  loadbalancer_target_group_id   = module.loadbalancer.loadbalancer_target_group_id
  subnet_ids                     = [module.network.private_az_a_subnet_id, module.network.private_az_b_subnet_id]
  secret_id                      = module.secretsmanager.secret_id
}

module "rds" {
  source = "./aws/rds"

  my_ip       = format("%s/%s", data.external.my_ip.result["internet_ip"], 32)
  environment = local.environment
  product     = local.product

  vpc_id     = module.network.vpc_id
  db_subnets = [module.network.private_az_a_subnet_id, module.network.private_az_b_subnet_id]
  private_cidr_blocks = [local.private_az_a_subnet_cidr_block, local.private_az_b_subnet_cidr_block]

  db_password = var.RDS_PASSWORD
}

module "secretsmanager" {
  source = "./aws/secretsmanager"

  environment = local.environment
  product     = local.product
}

module "cloudfront" {
  source = "./aws/cloudfront"

  environment = local.environment
  product     = local.product
}
