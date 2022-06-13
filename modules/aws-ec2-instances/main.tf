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
--------------------------------------------
    name           = "mydemosingleinstance"
  instance_count = 1
  ami                    = "ami-0c5204531f799e0c6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
     
--------------------------------------------


