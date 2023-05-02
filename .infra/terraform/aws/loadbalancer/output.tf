output "loadbalancer_security_group_id" {
    value = aws_security_group.gobarber_loadbalancer_security_group.id
}

output "loadbalancer_endpoint" {
    value = aws_lb.gobarber_loadbalancer.dns_name
}

output "loadbalancer_name" {
    value = aws_lb.gobarber_loadbalancer.name
}

output "loadbalancer_target_group_id" {
    value = aws_lb_target_group.target_group.id
}