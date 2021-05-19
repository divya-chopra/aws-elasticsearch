# Variables

variable application_name {
    description = "Name of the application"
    type = string
    default = "DKATALIS-ELASTIC"
}

variable vpc_id {
    description = "Provide VPC ID Name"
    type = string
}

variable allowed_cidr_block {
    description = "List of CIDRs that require bastion access"
    type = string
}

variable environment {
  description = "Please provide Environment value"
  type = string
  default = "DEV"
}

variable ami_elastic {
  description = "Provide AMI of elastic instance"
  type = string
}

variable ami_bastion {
  description = "Provide AMI of bastion instance"
  type = string
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
}

variable key_name_bastion {
  description = "Provide Key Name to SSH to instance"
  type = string
}

variable private_subnet1 {
  description = "Provide Private Subnet 1 ID"
  type = string
}

variable private_subnet2 {
  description = "Provide Private Subnet 2 ID"
  type = string
}

variable public_subnet1 {
  description = "Provide Public Subnet ID"
  type = string
}


locals {
    s3_bucket = "${var.application_name}-${var.environment}-S3"
}


data "aws_caller_identity" "current" {}


