variable "count" {
  description = "The number of EC2 instances that you want to Start at a particular time"
  default     = "1"
}

variable "ins_type" {
  description = "The type of machine that you want to Deploy"
  default     = "t2.micro"
}

variable "ami" {
  description = "The Amazon Machine Image (AMI) it is going to launch (Default='ami-0ac019f4fcb7cb7e6') "
  default     = "ami-0ac019f4fcb7cb7e6"
}

variable "subnet_id" {
  description = "The Subnet in which you want to launch your instance"
}
