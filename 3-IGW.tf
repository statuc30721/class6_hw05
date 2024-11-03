resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC-A-Virginia-Prod.id

  tags = {
    Name    = "app1_IG"
    Service = "application1"
    Owner   = "Frodo"
    Planet  = "Arda"
  }
}
