# --- ec2-instance/main.tf ---
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "ec2-example-vpc"
  cidr = "10.99.0.0/18"

  azs              = ["us-west-2a", "us-west-2b"]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]

  tags = {
    Name = "MysampleInstance"
  }

}
resource "aws_security_group" "project-iac-sg" {
  name        = "IAC-Sec-Group"
  description = "MYIAC-Sec-Group"
  vpc_id      = module.vpc.vpc_id

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
    protocol    = "tcp"
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
