# Terraform configuration
resource "aws_instance" "app_server" {
    tags = var.tags
                                                                                  # module "ec2_instance" {
                                                                                    #   source  = "terraform-aws-modules/ec2-instance/aws"

  #root_block_device = var.root_block_device
  #name = var.name 
  #instance_count = var.instance_count
  ami                    = var.ami 
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
}

