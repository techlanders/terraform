variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  type = "map"
default = {
    us-east-1      = "ami-0c94855ba95c71c99"
    us-east-2      = "ami-0603cbe34fd08cb81"
  }
}

