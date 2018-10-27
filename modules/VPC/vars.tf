variable "vpc_cidr_block" {
  description = "The VPC CIDR_BLOCK "
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  description = "The Tenancy of the given Resource"
  default     = "default"
}

variable "public_cidr_block" {
  description = "The CIDR_BLOCK for the public subnet"
  default     = "10.0.1.0/24"
}

variable "public_az_region" {
  description = "The Availability Zone in which the public subnet is going to be launched"
  default     = "us-east-1a"
}

variable "private_cidr_block" {
  description = "The CIDR_BLOCK for private subnet"
  default     = "10.0.2.0/24"
}

variable "private_az_region" {
  description = "The Availability Zone in which the private subnet is going to be launched"
  default     = "us-east-1c"
}
