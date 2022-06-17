# --- ec2-instance/main.tf ---

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance
  security_groups             = ["${module.aws-security-group.project-iac-sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true

  tags = {
    Name = "MysampleInstance"
  }
  depends_on = [module.aws-security-group.project-iac-sg]
  lifecycle {
    create_before_destroy = true
  }
}
