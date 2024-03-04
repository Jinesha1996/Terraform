resource "aws_vpc" "jdand" {
  cidr_block = "17.2.0.0/16"
  tags = {
    Name = "jdand_vpc"
  }
}

resource "aws_subnet" "jdand_public_subnet" {
  vpc_id     = aws_vpc.jdand.id
  cidr_block = "17.2.1.0/24"
  tags = {
    Name = "jdand_public_subnet"
  }
}
resource "aws_subnet" "jdand_private_subnet" {
  vpc_id     = aws_vpc.jdand.id
  cidr_block = "17.2.2.0/24"
  tags = {
    Name = "jdand_private_subnet"
  }
}

resource "aws_internet_gateway" "jdand_igw" {
    vpc_id = aws_vpc.jdand.id
    tags = {
        Name = "jdand_igw"
    }
  
}

resource "aws_route_table" "jdand_routetable_public" {
    vpc_id = aws_vpc.jdand.id
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.jdand_igw.id
    }
tags = {
        Name = "jdand_routetable_public"
    }
}
resource "aws_route_table_association" "jdand_public-rt_attach" {
    subnet_id = aws_subnet.jdand_public_subnet.id
    route_table_id = aws_route_table.jdand_routetable_public.id
}

resource "aws_route_table" "jdand_routetable_private" {
    vpc_id = aws_vpc.jdand.id
tags = {
        Name = "jdand_routetable_public"
    }
}
resource "aws_route_table_association" "rt_associate_private_2" {
    subnet_id = aws_subnet.jdand_private_subnet.id
    route_table_id = aws_route_table.jdand_routetable_private.id
}
