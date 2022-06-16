#--- ec2-instance/variables.tf ---

variable "ami_id" {
    type = string
    default = "ami-0b0ea68c435eb488d"
}

variable "instance" {
    type = string
    default = "t2.micro"
}
