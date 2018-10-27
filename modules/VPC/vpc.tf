resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr_block}"
  instance_tenancy     = "${var.tenancy}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    Name = "vpc"
  }
}

resource "aws_subnet" "main_public" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_cidr_block}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.public_az_region}"

  tags {
    subnet_type = "Public"
  }
}

resource "aws_subnet" "main_private" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.private_cidr_block}"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.private_az_region}"

  tags {
    subnet_type = "Private"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    VPC_ID = "${aws_vpc.main.id}"
  }
}

#Route Table

resource "aws_route_table" "main-route" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-gw.id}"
  }

  tags {
    Type   = "InterNet Gateway Public Route"
    VPC_ID = "${aws_vpc.main.id}"
  }
}

#Route Table Associtation

resource "aws_route_table_association" "public-route" {
  subnet_id      = "${aws_subnet.main_public.id}"
  route_table_id = "${aws_route_table.main-route.id}"
}

#######NAT GATEWAY###############

resource "aws_eip" "nat-eip" {
  vpc = "true"
}

##Nat Gateway

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat-eip.id}"
  subnet_id     = "${aws_subnet.main_public.id}"
  depends_on    = ["aws_internet_gateway.main-gw"]
}

## Vpc Setup For Nat

resource "aws_route_table" "route-private" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
  }

  tags {
    Type   = "NatGateway Private Route"
    VPC_ID = "${aws_vpc.main.id}"
  }
}
