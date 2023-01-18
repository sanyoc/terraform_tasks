output "alb_dns_name" {
  value       = aws_lb.taskalb.dns_name
  description = "DNS name of ALB"
}

output "route53_dns" {
  value       = data.aws_route53_zone.eivhomes.name_servers
  description = "Route53 DNS"
}