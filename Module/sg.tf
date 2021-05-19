# ELASTIC SECURITY GROUP 

resource "aws_security_group" "elastic_sg" {
  name        = "${var.application_name}-${var.environment}-SG"
  description = "SG for elastic instance"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH from Bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [ aws_security_group.bastion_sg.id ]
  }
  ingress {
    description      = "Ingress with self"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    self             = true
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.application_name}-${var.environment}-SG"
    Type = "ELASTIC"
  }
}

# BASTION SECURITY GROUP 

resource "aws_security_group" "bastion_sg" {
  name        = "DKATALIS-${var.environment}-CORE-INFRA-BASTION-SG"
  description = "SG for Bastion Instance"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH from Bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ var.allowed_cidr_block ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DKATALIS-${var.environment}-CORE-INFRA-BASTION"
    Type = "ELASTIC"
  }
}