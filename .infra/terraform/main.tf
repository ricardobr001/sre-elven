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

locals {
  environment = terraform.workspace
  product     = "Gobarber"
}

module "network" {
  source = "./aws/network"

  environment = local.environment
  product     = local.product

  vpc_cidr_block = "10.30.0.0/16"

  public_az_a_subnet_cidr_block  = "10.30.0.0/24"
  public_az_b_subnet_cidr_block  = "10.30.1.0/24"
  private_az_a_subnet_cidr_block = "10.30.2.0/24"
  private_az_b_subnet_cidr_block = "10.30.3.0/24"
}

module "cloudfront" {
  source = "./aws/cloudfront"

  environment = local.environment
  product     = local.product
}
