resource "aws_network_interface" "bastion_ext" {
    subnet_id = aws_subnet.public-us-east-1a.id

    tags = {
      Name = "primary_network_interface"
    }
}

# Get latest Windows Server 2022 AMI

#data "aws_ami" "windows-2022" {
#    most_recent = true
#    owners = ["amazon"]
#    filter {
#      name = "name"
#      values = ["Windows_Server-2022-Base-*"]
#    }
#
#}

# Create Windows EC2 Instance
resource "aws_instance" "bastion-evilbox" {
    ami = "ami-0324a83b82023f0b3"
    instance_type = "t2.medium"
    subnet_id = aws_subnet.public-us-east-1a.id
    vpc_security_group_ids = [aws_security_group.va-prod-sg01-bastion.id]
    associate_public_ip_address = true
    key_name = "bastionkeys"

    tags = {
      Name = "bastion-evilbox"
    }
    
}

#resource "aws_instance" "bastion" {
#    ami = "ami-0324a83b82023f0b3"
#    instance_type = "t2.medium"
#    availability_zone = "us-east-1a"
#    key_name = "bastionkeys"
#    vpc_security_group_ids = va-prod-sg01-bastion
#
#    network_interface {
#        network_interface_id = aws_network_interface.bastion_ext.id
#        device_index = 0      
#    }
#}

#------------------------------------------------------#
#
# Linux AMI Image 

# Retreive latest Amazon AMI linux image. 

#data "aws_ami" "latest-amazon-linux-image" {
#    most_recent = true
#    owners = ["amazon"]
#    filter {
#        name = "name"
#        values = [""]
#    }
#}

# Setup network interface to use for this linux virtual machine. 


resource "aws_instance" "app-server" {
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    availability_zone = "us-east-1d"
    key_name = "linuxapp1keypair"
    subnet_id = aws_subnet.private-us-east-1d.id
    vpc_security_group_ids = [aws_security_group.va-dev-sg01-servers.id] 

    
    tags = {
      Name = "app-server"
    }
  
}