# Terraform configuration
resource "aws_instance" "ec2_instance" {
    tags = var.tags
                                                                                  # module "ec2_instance" {
                                                                                    #   source  = "terraform-aws-modules/ec2-instance/aws"


  name = var.name 
  instance_count = var.instance_count
  ami                    = var.ami 
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
}

