# --- ec2-instance/main.tf ---
resource "aws_security_group" "project-iac-sg" {
  name        = "IAC-Sec-Group"
  description = "MYIAC-Sec-Group"
  vpc_id      = "vpc-5234832d"

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port   = 80
    protocol    = ""
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance
  vpc_security_group_ids = [
    aws_security_group.project-iac-sg.id
  ]

  tags = {
    Name = "MysampleInstance"
  }
  depends_on = [aws_security_group.project-iac-sg]
}
