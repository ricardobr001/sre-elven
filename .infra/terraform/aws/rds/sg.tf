resource "aws_security_group" "db_sg" {
  vpc_id = "${var.vpc_id}"

  ingress {
    description      = "TCP"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = [format("%s/%s",data.external.my_ip.result["internet_ip"],32)] # my-ip
  }

  # ingress {
  #   description      = "TCP"
  #   from_port        = 5432
  #   to_port          = 5432
  #   protocol         = "tcp"
  #   security_groups  = [var.wordpress_instance_sg_id]
  # }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.product} sb security group"
    Environment = var.environment
    Terraformed = true
  }
}