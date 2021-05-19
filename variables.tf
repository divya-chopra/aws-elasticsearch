# VPC Related Variables 

variable vpc_id {
    description = "Provide VPC ID Name"
    type = string
    default = "vpc-06139222f6b20cc79"
}

variable private_subnet1 {
  description = "Provide Private Subnet 1 ID"
  type = string
  default = "subnet-09314090720fb2488"
}

variable private_subnet2 {
  description = "Provide Private Subnet 2 ID"
  type = string
  default = "subnet-091c93f10ac01bf96"
}

variable public_subnet1 {
  description = "Provide Public Subnet ID"
  type = string
  default = "subnet-004e07bcd2f48c701"
}

variable allowed_cidr_block {
    description = "Cidr that require bastion access"
    type = string
    default = "0.0.0.0/0"
}

variable ami_elastic {
  description = "Provide AMI of elastic instance"
  type = string
  default = "ami-0747bdcabd34c712a"  //Ubuntu 18.04 AMI
}

variable ami_bastion {
  description = "Provide AMI of bastion instance"
  type = string
  default = "ami-0d5eff06f840b45e9" //Amazon Linux 2
}

variable instance_type_elastic {
  description = "Provide AMI of instance"
  type = string
  default = "t2.micro"
}

variable instance_type_bastion {
  description = "Provide AMI of instance"
  type = string
  default = "t2.micro"
}

variable key_name_elastic {
  description = "Provide Key Name to SSH to instance"
  type = string
  default ="pem-key"
}

variable key_name_bastion {
  description = "Provide Key Name to SSH to instance"
  type = string
  default ="pem-key"
}

