variable "environment" {
  type        = string
  description = "Target environment"
}

variable "product" {
  type        = string
  description = "Main product to host"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Vpc cidr_block"
}

variable "public_az_a_subnet_cidr_block" {
  type        = string
  description = "Public AZ-A subnet cidr_block"
}

variable "public_az_b_subnet_cidr_block" {
  type        = string
  description = "Public AZ-B subnet cidr_block"
}

variable "private_az_a_subnet_cidr_block" {
  type        = string
  description = "Private AZ-A subnet cidr_block"
}

variable "private_az_b_subnet_cidr_block" {
  type        = string
  description = "Private AZ-A subnet cidr_block"
}
