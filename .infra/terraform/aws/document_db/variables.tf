variable "environment" {
  type        = string
  description = "Target environment"
}

variable "product" {
  type        = string
  description = "Main product to host"
}

variable "my_ip" {
  type        = string
  description = "My public ip"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "private_cidr_blocks" {
  type        = list(string)
  description = "VPC cidr blocks"
}

variable "db_subnets" {
  type        = list(string)
  description = "Mongo db subnet ids"
}

variable "db_password" {
  type        = string
  description = "DB Password"
}
