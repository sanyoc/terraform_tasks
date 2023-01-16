output "Instance_Public_IP" {
  value       = aws_instance.instance.*.public_ip
  description = "Public IP of EC2 Instance"
}

output "load_balancer_DNS_name" {
  value = aws_lb.alb.dns_name
}