resource "aws_instance" "example"{
    ami =var.ami_id
    instance_type =var.public_instance_type
    availability_zone = var.availability_zone
    key_name =var.PATH_TO_PUBLIC_KEY
    subnet_id = var.public_subnets
    associate_public_ip_address = true
    source_dest_check = false
    security_groups = [aws_security_group.SG_pub.id]
    user_data = data.template_file.user_data.rendered

    tags = {
    Name = "CI-CD_Server"
  }
    
}

data "template_file" "user_data" {
    template = file("../../Modules/compute/user_data.sh")
 
}
