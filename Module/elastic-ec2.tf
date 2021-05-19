# USER DATA TEMPLATE FILE 

data "template_file" "elastic_userdata" {
  template = "${file("${path.module}/elastic.tpl")}"
  vars = {
    network_host = "localhost"
  }
}

####### Launch Configuration #######

resource "aws_launch_configuration" "this" {
  name_prefix                 = "${var.application_name}-${var.environment}-ELASTIC-LC"
  image_id                    = var.ami_elastic
  instance_type               = var.instance_type_elastic
  iam_instance_profile        = aws_iam_role.elastic-role.name
  key_name                    = var.key_name_elastic
  security_groups             = [ aws_security_group.elastic_sg.id ]
  user_data_base64            = base64encode(data.template_file.elastic_userdata.rendered)
  root_block_device {
            delete_on_termination = true
            encrypted             = true
            volume_size           = 10
            volume_type           = "gp2"
        }
  lifecycle {
    create_before_destroy = true
  }
}

# Autoscaling group

resource "aws_autoscaling_group" "this" {

  name_prefix           = "${var.application_name}-${var.environment}-ELASTIC-ASG"
  launch_configuration  = aws_launch_configuration.this.name
  vpc_zone_identifier   = [var.private_subnet1, var.private_subnet2]
  max_size              = 1
  min_size              = 1
   tags = [
      {
        "key"                 = "Name"
        "value"               = "${var.application_name}-${var.environment}-ELASTIC-ASG"
        "propagate_at_launch" = true
      }
    ]
  lifecycle {
    create_before_destroy = true
  }
}
