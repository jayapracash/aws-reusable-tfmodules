resource "aws_security_group" "project-iac-sg" {
  name        = "IAC-Sec-Group"
  description = "MYIAC-Sec-Group"
  
  //vpc_id      = module.aws_vpc.vpc.id 
    //vpc_id    = aws_vpc.vpc.id

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
variable "vpc_id" {}

output "security_groups" {
  value = "${aws_security_group.project-iac-sg.id}"
}

data "aws_security_group" "selected" {
  id = aws_security_group.project-iac-sg.id
}

  
