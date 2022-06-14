# --- ec2-instance/main.tf ---

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance
  vpc_security_group_ids = [
    aws_security_group.project-iac-sg.id
  ]

  tags = {
    Name = "MysampleInstance"
  }
}
