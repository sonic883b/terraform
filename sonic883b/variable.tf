
variable "developer" {
  default = [
    "sonic883b",
   "developer02",
   "developer03",
   "developer04",
   "developer05",
  ]
}

variable "ec2_options" {
  type = "map"

  default = {
    default.ami  = "ami-8e8847f1"
    default.instance_type = "t3.micro"
    default.subnet_id = "subnet-16d1764e"
    default.hostname = "dev"

    bastion.hostname = "bastion"
    bastion.name = "bastion"
  }
  
}

variable key_name {}
variable public_key_path {}


