# ============================================
# EXAMPLE: Simple Amazon Linux 
# ============================================

module "ami_amazon_linux" {
  source = "../../../module"

  os_type         = var.os_type
  ami_owners      = [var.ami_owner]
  ami_name_filter = var.ami_name_filter
  most_recent     = true
  ami_tag_filters = {
    environment = var.ami_tag_filters["environment"]
    team        = var.ami_tag_filters["team"]
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

  os_type         = "ubuntu"
  ami_owners      = [var.ami_owner]
  ami_name_filter = "ubuntu/image"
  most_recent     = true
  ami_tag_filters = {
    environment = "dev"
    os_version  = "24.04"
    base_os     = "ubuntu-24.04"
  }
  architecture        = "x86_64"
  virtualization_type = "hvm"
  root_device_type    = "ebs"
}

# ============================================
# EXAMPLE: Windows 
# ============================================

module "ami_windows" {
  source = "../../../module"

  os_type         = "windows"
  ami_owners      = [var.ami_owner]
  ami_name_filter = "windows-2025"
  
}


# Use in EC2 module
/*module "ec2" {
  source = "../../modules/ec2"
  
  ami_id = module.ami_amazon_linux.ami_id
  # ... other EC2 config
}
*/

# Output all AMI information
output "ami_complete_info" {
  value = {
    id                  = module.ami_amazon_linux.ami_id
    name                = module.ami_amazon_linux.ami_name
    owner               = module.ami_amazon_linux.ami_owner_id
    architecture        = module.ami_amazon_linux.ami_architecture
    creation_date       = module.ami_amazon_linux.ami_creation_date
    description         = module.ami_amazon_linux.ami_description
  }
}