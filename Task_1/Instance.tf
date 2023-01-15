resource "aws_instance" "instance1" {
  ami                         = var.ami-id
  instance_type               = var.instance-size
  subnet_id                   = aws_subnet.public-1a.id
  vpc_security_group_ids      = [aws_security_group.myVPC-sg.id]
  key_name                    = var.task-key
  associate_public_ip_address = true
  user_data                   = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world from EC2-1" > /var/www/html/index.html
    EOF

  tags = var.task-tags

}

resource "aws_instance" "instance2" {
  ami                         = var.ami-id
  instance_type               = var.instance-size
  subnet_id                   = aws_subnet.public-1b.id
  vpc_security_group_ids      = [aws_security_group.myVPC-sg.id]
  key_name                    = var.task-key
  associate_public_ip_address = true
  user_data                   = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world from EC2-2" > /var/www/html/index.html
    EOF

  tags = var.task-tags

}

resource "aws_instance" "instance3" {
  ami                         = var.ami-id
  instance_type               = var.instance-size
  subnet_id                   = aws_subnet.public-1c.id
  vpc_security_group_ids      = [aws_security_group.myVPC-sg.id]
  key_name                    = var.task-key
  associate_public_ip_address = true
  user_data                   = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world from EC2-3" > /var/www/html/index.html
    EOF

  tags = var.task-tags

}