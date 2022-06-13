# Input variable definitions

variable "name" {
  description = "Name of the ec2 instance."
  type        = string
}

variable "ami" {
  description = "Name of the ami"
  type        = string
}

variable "instance_type" {
  description = "Name of the instance_type"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "list of groupid of vpc security group"
  type        = list(string)
}

variable "subnet_id" {
  description = "Name of the subnet_id"
  type        = string
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "associate_public_ip_address" {
  description = "enabling public ip"
  type        = bool
}
variable "key_name" {
  description = "testing security group key"
  type        = string
}
variable " root_block_device" {
  description = "enabling public ip"
  type        = map
}
