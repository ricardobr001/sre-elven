variable "environment" {
  type        = string
  description = "Target environment"
}

variable "product" {
  type        = string
  description = "Main product to host"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "private_cidr_blocks" {
  type        = list(string)
  description = "VPC cidr blocks"
}

variable "redis_subnets" {
  type        = list(string)
  description = "Redis subnets"
}
