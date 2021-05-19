# Bastion Server 

resource "aws_instance" "bastion" {
  ami           = var.ami_bastion
  instance_type = var.instance_type_bastion
  key_name      = var.key_name_bastion
  associate_public_ip_address = true
  tags = {
    "Name"     = "DKATALIS-${var.environment}-CORE-INFRA-BASTION"
  }
  root_block_device {
    delete_on_termination = "true"
    volume_type           = "gp2"
    volume_size           = 10
  }
  subnet_id              = var.public_subnet1
  vpc_security_group_ids = [ aws_security_group.bastion_sg.id ]
}
