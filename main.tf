module "key" {
  source             = "modules/KEY"
  key_name           = ""
  PATH_TO_PUBLIC_KEY = ""
}

module "Nginx" {
  source   = "modules/EC2"
  count    = 1
  ins_type = "t2.micro"
  ami      = "${lookup(var.ec2_ami_ubuntu,var.region)}"
  key_name = "${module.key.key_name}"
}

module "node-js" {
  source   = "modules/EC2"
  count    = 1
  ins_type = "t2.micro"
  ami      = "${lookup(var.ec2_ami_ubuntu,var.region)}"
  key_name = "${module.key.key_name}"
}
