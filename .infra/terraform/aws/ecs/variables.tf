variable "environment" {
  type        = string
  description = "Target environment"
}

variable "product" {
  type        = string
  description = "Main product to host"
}

variable "ecr_image" {
  type        = string
  description = "ECR URI plus image tag"
}

variable "vpc_id" {
  type        = string
  description = "Default vpc id"
}

variable "loadbalancer_security_group_id" {
  type        = string
  description = "Loadbalance security group id"
}

variable "loadbalancer_target_group_id" {
  type        = string
  description = "Loadbalance target group id"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet ids"
}

variable "secret_id" {
  type        = string
  description = "Secret id"
}
