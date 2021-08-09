variable "cidr_block" {
  default = "172.20.0.0/16"
}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true 
}

variable "vpc_name" {
  default = "Management-VPC"
}

variable "environment" {
  default = "dev"
}

variable "public_subnet_cidr" {
  default = "172.20.10.0/24"
}

variable "private_subnet_cidr" {
  default = "172.20.20.0/24"
}

variable "public_subnet_name" {
  default = "Public-Subnet"
}

variable "private_subnet_name" {
  default = "Private-Subnet"
}