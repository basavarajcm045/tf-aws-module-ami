# ============================================
# EXAMPLE: Complete EC2 + AMI Integration
# ============================================

# Find AMI
module "ami" {
  source = "../../../module/"

  ami_name_filter = var.ami_name_filter
  ami_owners      = [var.ami_owner]

  ami_tag_filters = {
    version = var.ami_tag_filters["version"]
  }
}


# Use AMI in EC2 instance
/*module "ec2_web_servers" {
  source = "../../../module/ec2"

  instance_count = 3
  instance_type  = "t3.medium"
  ami_id         = module.ami.ami_id  # ← Use AMI from module
  
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
  key_pair_name      = var.key_pair_name
  
  tags = {
    Name        = "web-server"
    AMI_Name    = module.ami.ami_name
    AMI_Created = module.ami.ami_creation_date
  }
}

# Use AMI in Auto Scaling Group
resource "aws_launch_template" "asg" {
  name_prefix   = "web-asg"
  image_id      = module.ami.ami_id  # ← Use AMI from module
  instance_type = "t3.medium"
  
  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    ssh_user = module.ami.default_ssh_user  # ← Automatic SSH user detection
  }))
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name     = "web-server-asg"
      AMI_ID   = module.ami.ami_id
      OS_Type  = module.ami.search_criteria.os_type
    }
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 2
  launch_template {
    id      = aws_launch_template.asg.id
    version = "$Latest"
  }
  vpc_zone_identifier = var.subnet_ids

  tag {
    key                 = "Name"
    value               = "web-server-asg"
    propagate_at_launch = true
  }
}*/