resource "aws_route_table" "private-VPC-A-Virginia-PROD" {
  vpc_id = aws_vpc.VPC-A-Virginia-Prod.id

  route  {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }


  tags = {
    Name = "private-VPC-A-Virginia-PROD-RT"
  }
}

resource "aws_route_table" "public-VPC-A-Virginia-PROD" {
  vpc_id = aws_vpc.VPC-A-Virginia-Prod.id

  route   {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }

    # Route for traffic via transit gateway. 
  route {
      cidr_block                 = "10.0.0.0/8"
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.virginia-app-site-TGW.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }

  tags = {
    Name = "public-VPC-A-Virginia-PROD-RT"
  }
}

resource "aws_route_table_association" "private-us-east-1a" {
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.private-VPC-A-Virginia-PROD.id
}

# Public Virginia VPC Production

resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.public-VPC-A-Virginia-PROD.id
}

#------------------------------------------------------------#
#
# Virgina DEV VPC

resource "aws_route_table" "private-VPC-D-Virginia-DEV" {
  vpc_id = aws_vpc.VPC-D-Virginia-DEV.id

# Route for traffic via transit gateway. 
  route {
      cidr_block                 = "10.0.0.0/8"
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.virginia-app-site-TGW.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }
  
  tags = {
    Name = "private-VPC-D-Virginia-DEV-RT"
  }
}


resource "aws_route_table_association" "private-us-east-1d" {
  subnet_id      = aws_subnet.private-us-east-1d.id
  route_table_id = aws_route_table.private-VPC-D-Virginia-DEV.id
}

#------------------------------------------------------------#
#
# Virgina TEST VPC

resource "aws_route_table" "private-VPC-F-Virginia-TEST" {
  vpc_id = aws_vpc.VPC-F-Virginia-TEST.id

# Route for traffic via transit gateway. 
  route {
      cidr_block                 = "10.0.0.0/8"
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.virginia-app-site-TGW.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }
  
  tags = {
    Name = "private-VPC-F-Virginia-TEST-RT"
  }
}


resource "aws_route_table_association" "private-us-east-1f" {
  subnet_id      = aws_subnet.private-us-east-1f.id
  route_table_id = aws_route_table.private-VPC-F-Virginia-TEST.id
}