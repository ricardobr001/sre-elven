variable gobarber_loadbalancer_subnets_ids {
  type        = list
  description = "Wordpress loadbalancer subnets ids"
}

variable vpc_id {
  type        = string
  description = "Wordpress vpc id"
}

variable "environment" {
  type        = string
  description = "Target environment"
}

variable "product" {
  type        = string
  description = "Main product to host"
}
