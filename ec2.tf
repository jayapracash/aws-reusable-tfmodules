#--- root/ ec2.tf ---
module "aws-vpc-module" {
  source = "./modules/vpc-module"
}
  module "aws-security-group" {
  source = "./modules/security-group-module"
  vpc_id = "${var.vpc_id}"
}

module "ec2-instance" {
  source = "./modules/ec2-instance"
  subnet_id     = "${var.subnet_id}"
}
