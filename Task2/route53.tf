data "aws_route53_zone" "eivhomes" {
  name         = "eivhomes.com"
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.eivhomes.zone_id
  name    = "eivhomes.com"
  type    = "A"
  ttl     = "60"
   
    # alias {
    #   name                   = aws_lb.taskalb.dns_name
    #   zone_id                = aws_lb.taskalb.zone_id
    #   evaluate_target_health = true
    # }
  
  records = [aws_lb.taskalb.dns_name]
}