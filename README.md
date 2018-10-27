# Terrform-Lite :octocat:

### A tool build by me by extending TERRAFORM and making it complete dynamic and modular so that user can just setup the environment or stack without starting from scratch.

#### The various Resources of AWS are defined as modules in a very dynamic way that user just need to use simple configuration in its stack and is ready to go

#### Supported Modules are:-

1. VPC 
2. EC2 
3. KEY (AWS Key_Pair )

---

#### How To Use it:

- [x] Clone the Git Repo
- [x] Define your **access_key** and **secret_key** and **region** in **terraform.tfvars**
- [x] Start Writing Your **main.tf**

---

### 1. Creating a VPC 


> Simply just put this code in main.tf to create your vpc 
```sh
module "vpc"  { **#anyname**
  source             = "modules/VPC"
  vpc_cidr_block     = "192.168.0.0/16" **# cidr_block for VPC**
  public_cidr_block  = "192.168.1.0/24" **# cidr_block for Subnet (This subnet will be public)
  public_az_region   = "us-east-1a"     **# region in which you want your public subnet
  private_cidr_block = "192.168.2.0/24" **# cidr_block for subnet (This subnet will be private)
  private_az_region  = "us-east-1b"     **# region in which you want your private subnet
}
```

#### Its so simple the backend will configure the neccessary setting and all other things will be taken care

---

### 2. Creating an EC# Instance

> simply just put this code in main.tf to create your EC#

##### Public subnet sample

```sh
module "Nginx" {
  source    = "modules/EC2"
  count     = 1     **# no of instance you want to launch
  ins_type  = "t2.micro"  **# the type of instance that you want to launch
  ami       = "${lookup(var.ec2_ami_ubuntu,var.region)}" **# lookup for your ubuntu
  subnet_id = "${module.vpc.public_subnet_id}"  **#public subnet id or Remove it to launch on default vpc
  key_name  = "${module.key.key_name}" **#Key pair name
}
```

##### Private subnet sample

```sh
module "node-js" {
  source    = "modules/EC2"
  count     = 1
  ins_type  = "t2.micro"
  ami       = "${lookup(var.ec2_ami_ubuntu,var.region)}"
  subnet_id = "${module.vpc.private_subnet_id}"
  key_name  = "${module.key.key_name}"
}
```

---

### 3. Creating Key Pair for EC# instance

> simply just put this code in main.tf to create your key Pair

```sh
module "key" {
  source             = "modules/KEY"
  key_name           = "" **#key pair name
  PATH_TO_PUBLIC_KEY = "" **#path in your machine where this is key is pasted
}
```