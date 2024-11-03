# Create Security Group for each VPC. 

resource "aws_security_group" "va-prod-sg01-bastion" {
    name = "va-prod-sg01-bastion"
    description = "Allow RDP inbound traffic and all outbound traffic for bastion host"
    vpc_id = aws_vpc.VPC-A-Virginia-Prod.id

    ingress {
        description = "BastionRDP"
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
        Name = "va-prod-sg01-bastion"
        Service = "BastionHost"
        Owner = "Frodo"
        Planet = "Arda"
    }
}

# Security group for Production Application Servers. 
resource "aws_security_group" "va-prod-sg02-servers" {
    name = "va-prod-sg02-servers"
    description = "Allow SSH and HTTP traffic to production servers"
    vpc_id = aws_vpc.VPC-A-Virginia-Prod.id

    ingress {
        description = "SSH_DEV"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP_DEV"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
        Name = "va-prod-sg02-servers"
        Service = "application-servers"
        Owner = "Frodo"
        Planet = "Arda"
    }
}


# Security Group for Development VPC. 

resource "aws_security_group" "va-dev-sg01-servers" {
    name = "va-dev-sg01-servers"
    description = "Allow SSH, ICMP and HTTP inbound traffic and all outbound traffic to development network."
    vpc_id = aws_vpc.VPC-D-Virginia-DEV.id

    ingress {
        description = "SSH_DEV"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP_DEV"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "ICMP_DEV"
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = ["10.0.0.0/8"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
        Name = "va-dev-sg01-servers"
        Service = "applications"
        Owner = "Frodo"
        Planet = "Arda"
    }
}
