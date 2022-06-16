# --- ec2-instance/main.tf ---
#module "vpc" {
#source  = "terraform-aws-modules/vpc/aws"
#version = "~> 3.0"
resource "aws_vpc" "vpc" {

  cidr_block = "10.0.0.0/16"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true
  tags = {
    Name = "MysampleInstance"
  }

}
# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
vpc_id    = aws_vpc.vpc.id
tags = {
Name    = "internet_gateway"
}
}

data "aws_availability_zones" "available" {
  state = "available"
}

# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
vpc_id                  = aws_vpc.vpc.id
cidr_block              = "10.0.0.0/24"
availability_zone       = data.aws_availability_zones.available.names[0]
map_public_ip_on_launch = true
tags      = {
Name    = "public-subnet-1"
}
}
# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "public-route-table" {
vpc_id       = aws_vpc.vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.internet-gateway.id
}
tags       = {
Name     = "Public Route Table"
}
}
# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
subnet_id           = aws_subnet.public-subnet-1.id
route_table_id      = aws_route_table.public-route-table.id
}


resource "aws_security_group" "project-iac-sg" {
  name        = "IAC-Sec-Group"
  description = "MYIAC-Sec-Group"
  //vpc_id      = module.vpc.vpc_id 
    vpc_id    = aws_vpc.vpc.id

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
  security_groups             = ["${aws_security_group.project-iac-sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true

  tags = {
    Name = "MysampleInstance"
  }
  depends_on = [aws_security_group.project-iac-sg]
  lifecycle {
    create_before_destroy = true
  }
}
