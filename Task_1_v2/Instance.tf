locals {
  ec2_subnet_list = [aws_subnet.public_1a.id, aws_subnet.public_1b.id, aws_subnet.public_1c.id]
}

resource "aws_instance" "instance" {
  count                       = var.ec2_count
  ami                         = var.ami_id
  instance_type               = var.instance_size
  subnet_id                   = element(local.ec2_subnet_list, count.index)
  security_groups             = [aws_security_group.my_vpc_sg.id]
  key_name                    = var.task_key
  associate_public_ip_address = true

  user_data = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world from $(hostname -s)" > /var/www/html/index.html
    EOF

  tags = merge(
    var.task_tags,
    {
      Name = "Instance-${count.index + 1}"
    }
  )
}