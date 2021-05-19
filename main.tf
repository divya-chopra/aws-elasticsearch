module "elastic-ec2-infra" {
    source                 = "./Module"
    vpc_id                 = var.vpc_id
    private_subnet1        = var.private_subnet1
    private_subnet2        = var.private_subnet2
    public_subnet1         = var.public_subnet1
    allowed_cidr_block     = var.allowed_cidr_block
    environment            = "DEV"
    ami_elastic            = var.ami_elastic
    ami_bastion            = var.ami_bastion
    instance_type_elastic  = var.instance_type_elastic
    instance_type_bastion  = var.instance_type_bastion
    key_name_elastic       = var.key_name_elastic
    key_name_bastion       = var.key_name_bastion
}