
variable "aws_region" {
    default = "ap-south-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ec2"
}

variable "vpc_id" {
    description = "VPI ID"
    type        = string
}
variable "environment" {
  default = "dev"
}

variable "cidr_block" {
  default = "172.20.0.0/16"
}

variable "public_subnets" {
    description = "public_subnets"
    type        = string
}

variable "private_subnets" {
    description = "private_subnets"
    type        = string
}

variable "ami_id" {
  default = "ami-00bf4ae5a7909786c"
}

variable "private_instance_type" {
    description = "private_ec2_type"
    type        = string
}

variable "availability_zone" {
    description = "availability zone"
    default        = "ap-south-1a"
}

variable "public_instance_type" {
    description = "private_ec2_type"
    type        = string
}