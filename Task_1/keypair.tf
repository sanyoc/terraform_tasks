resource "aws_key_pair" "task-key" {
  key_name   = var.task-key
  public_key = file("~/.ssh/id_rsa.pub")
}