
resource "aws_instance" "private_instance"{
    ami =var.ami_id
    instance_type =var.private_instance_type
    availability_zone = var.availability_zone
    key_name =var.PATH_TO_PUBLIC_KEY
    subnet_id = var.private_subnets
    associate_public_ip_address = false
    source_dest_check = false
    security_groups = [aws_security_group.ssh_priv.id]
   

    tags = {
    Name = "Tomcat_Server"
  }
    
}

