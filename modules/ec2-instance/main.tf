# --- ec2-instance/main.tf ---

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance
  associate_public_ip_address = true

  tags = {
    Name = "MysampleInstance"
  }
  #depends_on = [module.aws-security-group.project-iac-sg]
  lifecycle {
    create_before_destroy = true
  }
}
