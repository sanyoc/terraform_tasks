locals {
  userdata = <<EOF
    #!/bin/bash
    yum install httpd -y
    service httpd start
    chkconfig httpd on
    echo "Hello, world from $(hostname -s)" > /var/www/html/index.html
    EOF
}

resource "aws_launch_template" "web" {
  name_prefix            = "web"
  image_id               = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  key_name               = "bastion-key"
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.http_sg.id]

  user_data = base64encode(local.userdata)

  tags = var.common_tags
}