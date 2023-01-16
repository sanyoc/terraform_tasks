resource "aws_key_pair" "task_key" {
  key_name   = var.task_key
  public_key = file("~/.ssh/id_rsa.pub")
}