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



