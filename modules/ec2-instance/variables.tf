#--- ec2-instance/variables.tf ---

variable "ami_id" {
    type = string
    default = "ami-06cffe063efe892ad"
}

variable "instance" {
    type = string
    default = "t2.micro"
}
