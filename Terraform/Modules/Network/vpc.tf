# Creation of the VPC

resource "aws_vpc" "default" {
  cidr_block = var.cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
      Name = var.vpc_name
      Environment = var.environment
  }
}


# Creation of Public Subnets

resource "aws_subnet" "default_public" {
    vpc_id     = aws_vpc.default.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "ap-south-1a"
  tags = {
      Name = var.public_subnet_name
      Environment = var.environment
  }
}

# Creation of Private Subnets

resource "aws_subnet" "default_private" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "ap-south-1a"
  tags = {
      Name = var.private_subnet_name
      Environment = var.environment
  }
}

locals{
    ig_name =format("igw-%s",var.environment)
    eip_name =format("eip-%s",var.environment)
    nat_name =format("nat-%s",var.environment)
    route_public = format("route_public-%s",var.environment)
    route_private = format("route_private-%s",var.environment)
}

# Creation of Internet Gateway

resource "aws_internet_gateway" "default" {
  vpc_id    = aws_vpc.default.id
  tags = {
      Name = local.ig_name
      Environment = var.environment
  }
}

# Creation of Elastic IP

resource "aws_eip" "default" {
  vpc = true
  tags = {
      Name = local.eip_name
      Environment = var.environment
  }
}

# Creation of Nat Gateway

resource "aws_nat_gateway" "default" {
  allocation_id = aws_eip.default.id
  subnet_id     = aws_subnet.default_public.id
  tags = {
      Name = local.nat_name
      Environment = var.environment
  }
}

# Create route table for the Public Subnet

resource "aws_route_table" "default_public" {
  vpc_id    = aws_vpc.default.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.default.id
  }
  tags = {
      Name = local.route_public
      Environment = var.environment
  }
}

# Route Table Association

resource "aws_route_table_association" "default_public" {
  route_table_id = aws_route_table.default_public.id
  subnet_id      = aws_subnet.default_public.id
}

# Create route table for the Private Subnet

resource "aws_route_table" "default_private" {
  vpc_id    = aws_vpc.default.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.default.id
  }
  tags = {
      Name = local.route_private
      Environment = var.environment
  }
}

# Route Table Association of Private Subnet

resource "aws_route_table_association" "default_private" {
  route_table_id = aws_route_table.default_private.id
  subnet_id      = aws_subnet.default_private.id
}
