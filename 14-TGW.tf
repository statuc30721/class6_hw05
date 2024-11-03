resource "aws_ec2_transit_gateway" "virginia-app-site-TGW" {
    auto_accept_shared_attachments = "enable"
#    default_route_table_association = "enable"
#    default_route_table_propagation = "enable"
    dns_support = "enable"
    description = "virginia-app-site-TGW"
    tags = {
      Name = "TGW_Homework05"
    }
}

#-------------------------------------------------------------------#
# Transit gateway attachment for Production VPC

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_Virginia_VPC_PROD" {
    subnet_ids = [aws_subnet.public-us-east-1a.id]
    transit_gateway_id = aws_ec2_transit_gateway.virginia-app-site-TGW.id
    vpc_id = aws_vpc.VPC-A-Virginia-Prod.id

    tags = {
      Name = "TGA_VPC_PROD"
    }
}

#-------------------------------------------------------------------#
# Transit gateway attachment for Development VPC

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_Virinia_VPC_DEV" {
    subnet_ids = [aws_subnet.private-us-east-1d.id]
    transit_gateway_id = aws_ec2_transit_gateway.virginia-app-site-TGW.id
    vpc_id = aws_vpc.VPC-D-Virginia-DEV.id

    tags = {
      Name = "TGA_VPC_DEV"
    }
}

#-------------------------------------------------------------------#
# Transit gateway attachment for Test VPC

resource "aws_ec2_transit_gateway_vpc_attachment" "TGA_Virinia_VPC_TEST" {
    subnet_ids = [aws_subnet.private-us-east-1f.id]
    transit_gateway_id = aws_ec2_transit_gateway.virginia-app-site-TGW.id
    vpc_id = aws_vpc.VPC-F-Virginia-TEST.id

    tags = {
      Name = "TGA_VPC_TEST"
    }
}