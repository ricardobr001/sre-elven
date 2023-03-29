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

variable "db_subnets" {
  type        = list(string)
  description = "Mongo db subnet ids"
}
