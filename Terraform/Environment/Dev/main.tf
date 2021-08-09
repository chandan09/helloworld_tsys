module "vpc_network" {
  source = "../../Modules/Network"
  vpc_name  = "Development-VPC"
}

module "web_cluster" {
  source = "../../Modules/compute"
  vpc_id = module.vpc_network.vpc_id  
  public_subnets=module.vpc_network.public_subnets
  private_subnets= module.vpc_network.private_subnets
  private_instance_type=var.private_instance_type
  public_instance_type=var.public_instance_type
}

