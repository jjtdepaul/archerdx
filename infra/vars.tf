variable "AWS_REGION" {
  default = "us-west-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "archerkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "archerkey.pub"
}

variable "AZ1" {
  default = "us-west-2a"
}

variable "AZ2" {
  default = "us-west-2b"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-west-1 = "ami-b2c1d9d2"
    us-west-2 = "ami-fef48b86"
  }
}

variable "public_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_cidrs" {
  type = list(string)
  default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "AZS" {
  type = list(string)
  default = ["us-west-2a", "us-west-2b"]
}

# Local variables
locals {
  subnets = {
    pub_a = {
      cidr = "10.0.0.0/20"
      az = "us-east-2a"
    },
    pub_b = {
      cidr = "10.0.16.0/20"
      az = "us-east-2b"
    },
    pub_c = {
      cidr = "10.0.32.0/20"
      az = "us-east-2c"
    }
  }
}

