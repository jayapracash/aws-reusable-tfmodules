#--- root/ ec2.tf ---

module "ec2-instance" {
  source = "./modules/ec2-instance"

}
