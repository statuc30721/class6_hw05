# this  makes  vpc.id which is aws_vpc.VPC-A-Virginia-Prod.id
resource "aws_vpc" "VPC-A-Virginia-Prod" {
  cidr_block = "10.22.0.0/16"

  tags = {
    Name = "VPC-A-Virginia-Prod"
    Service = "application1"
    Owner = "Frodo"
    Planet = "Arda"
  }
}


# this  makes  vpc.id which is aws_vpc.VPC-F-Virginia-DEV.id
resource "aws_vpc" "VPC-D-Virginia-DEV" {
  cidr_block = "10.21.0.0/16"

  tags = {
    Name = "VPC-D-Virginia-DEV"
    Service = "application1"
    Owner = "Frodo"
    Planet = "Arda"
  }
}

# this  makes  vpc.id which is aws_vpc.VPC-F-Virginia-TEST.id
resource "aws_vpc" "VPC-F-Virginia-TEST" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "VPC-F-Virginia-TEST"
    Service = "application1"
    Owner = "Frodo"
    Planet = "Arda"
  }
}