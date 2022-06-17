#--- root/ ec2.tf ---
module "aws-vpc-module" {
  source = "./modules/vpc-module"
}
  module "aws-security-group" {
  source = "./modules/security-group-module"
}

module "ec2-instance" {
  source = "./modules/ec2-instance"
}
