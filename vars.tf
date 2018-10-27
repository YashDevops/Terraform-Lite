variable "access_key" {
  description = "The Access Key for the given Account"
  default     = "None"
}

variable "secret_key" {
  description = "The Secret Key for the given Account"
  default     = "None"
}

variable "region" {
  description = "The Region where you want to launch your instances"
  default     = "us-east-1"
}

variable "ec2_ami_ubuntu" {
  description = "List of all the ubuntu ami in the region"
  type        = "map"

  default = {
    us-east-1      = "ami-059eeca93cf09eebd"
    us-east-2      = "ami-0782e9ee97725263d"
    us-west-1      = "ami-840112e4"
    us-west-2      = "ami-6f523217"
    ap-south-1     = "ami-ffc3e790"
    ap-northeast-2 = "ami-b9cf61d7"
    ap-southeast-1 = "ami-0c5199d385b432989"
    ap-southeast-2 = "ami-f13ff693"
    ap-northeast-1 = "ami-83b5a7ff"
    ca-central-1   = "ami-0f2cb2729acf8f494"
    eu-central-1   = "ami-d95d0532"
    eu-west-1      = "ami-7b431902"
    eu-west-2      = "ami-f8f6169f"
    eu-west-3      = "ami-28fd4c55"
    sa-east-1      = "ami-e159088d"
  }
}
