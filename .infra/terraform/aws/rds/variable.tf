variable db_subnets {
  type        = list
  description = "Wordpress db subnet id"
}

data "external" "my_ip" {
    program = ["/bin/bash", "${path.module}/scripts/whats-my-ip.sh"]
}

variable vpc_id {
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
