variable "public_az_a_subnet_cidr_block" {
  type        = string
  description = "Wordpress public AZ-A subnet cidr_block"
}

variable "public_az_b_subnet_cidr_block" {
  type        = string
  description = "Wordpress public AZ-B subnet cidr_block"
}

variable "private_az_a_subnet_cidr_block" {
  type        = string
  description = "Wordpress private AZ-A subnet cidr_block"
}

variable "private_az_b_subnet_cidr_block" {
  type        = string
  description = "Wordpress private AZ-A subnet cidr_block"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Wordpress vpc cidr_block"
}
