#These are   for  public

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.VPC-A-Virginia-Prod.id
  cidr_block              = "10.22.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-1a"
    Service = "application1"
    Owner   = "Frodo"
    Planet  = "Arda"
  }
}




#these are for private
resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.VPC-A-Virginia-Prod.id
  cidr_block        = "10.22.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "private-us-east-1a"
    Service = "application1"
    Owner   = "Frodo"
    Planet  = "Arda"
  }
}

resource "aws_subnet" "private-us-east-1d" {
  vpc_id            = aws_vpc.VPC-D-Virginia-DEV.id
  cidr_block        = "10.21.14.0/24"
  availability_zone = "us-east-1d"

  tags = {
    Name    = "private-us-east-1d"
    Service = "application1"
    Owner   = "Frodo"
    Planet  = "Arda"
  }
}


resource "aws_subnet" "private-us-east-1f" {
  vpc_id            = aws_vpc.VPC-F-Virginia-TEST.id
  cidr_block        = "10.20.16.0/24"
  availability_zone = "us-east-1f"

  tags = {
    Name    = "private-us-east-1f"
    Service = "application1"
    Owner   = "Frodo"
    Planet  = "Arda"
  }
}
