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
