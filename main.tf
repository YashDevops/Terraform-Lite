module "vpc" {
  source             = "modules/VPC"
  vpc_cidr_block     = "192.168.0.0/16"
  public_cidr_block  = "192.168.1.0/24"
  public_az_region   = "us-east-1a"
  private_cidr_block = "192.168.2.0/24"
  private_az_region  = "us-east-1b"
}

module "instance" {
  source    = "modules/EC2"
  count     = 1
  ins_type  = "t2.micro"
  ami       = "${lookup(var.ec2_ami_ubuntu,var.region)}"
  subnet_id = "${module.vpc.public_subnet_id}"
}
