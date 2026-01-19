# ============================================
# EXAMPLE: Simple Amazon Linux 
# ============================================

module "ami_amazon_linux" {
  source = "../../../module"

  ami_owners      = [var.ami_owner]
  ami_name_filter = var.ami_name_filter
  most_recent     = true
  ami_tag_filters = {
    environment = var.ami_tag_filters["environment"]
    version     = var.ami_tag_filters["version"]
  }

  architecture        = var.architecture
  virtualization_type = var.virtualization_type
  root_device_type    = var.root_device_type
}

# ============================================
# EXAMPLE: Ubuntu 
# ============================================

module "ami_ubuntu" {
  source = "../../../module"

  ami_owners      = [var.ami_owner]
  ami_name_filter = var.ubuntu_ami_name_filter
  most_recent     = true
  ami_tag_filters = {
    environment = var.ubuntu_ami_tag_filters["environment"]
    os_version  = var.ubuntu_ami_tag_filters["os_version"]
    base_os     = var.ubuntu_ami_tag_filters["base_os"]
  }

  architecture        = var.ubuntu_architecture
  virtualization_type = var.ubuntu_virtualization_type
  root_device_type    = var.ubuntu_root_device_type
}

/*resource "aws_instance" "main" {
  ami           = module.ami_amazon_linux.ami_id
  instance_type = "t3.micro"

}

resource "aws_instance" "this" {
  ami           = module.ami_ubuntu.ami_id
  instance_type = "t3.micro"

}*/

# Use in EC2 module
/*module "ec2" {
  source = "../../modules/ec2"
  
  ami_id = module.ami_amazon_linux.ami_id
  # ... other EC2 config
}
*/
