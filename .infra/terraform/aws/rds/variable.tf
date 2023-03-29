variable "db_subnets" {
  type        = list(any)
  description = "Wordpress db subnet id"
}

variable "vpc_id" {
  type        = string
  description = "description"
}

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
