# ============================================
# EXAMPLE 1: Simple Amazon Linux 
# ============================================

module "ami_amazon_linux" {
  source = "../../"

  os_type         = "amazon-linux"
  ami_owners      = ["533267218601"]
  ami_name_filter = "amzn-demo"
  most_recent = true
  ami_tag_filters = {
    environment = "dev"
    team        = "platform"
    version     = "1.1.1"
    //version     = "0.0.1"
  }

  architecture = "x86_64"
  virtualization_type = "hvm"
  root_device_type = "ebs"
}

# ============================================
# EXAMPLE 2: Ubuntu 
# ============================================

module "ami_ubuntu" {
  source = "../../"

  os_type         = "ubuntu"
  ami_owners      = ["533267218601"]
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
# EXAMPLE 6: ARM64 Architecture (Graviton)
# ============================================

/*module "ami_arm64" {
  source = "../../modules/ami"

  os_type      = "amazon-linux-2023"
  architecture = "arm64"
}*/

# Use in EC2 module
/*module "ec2" {
  source = "../../modules/ec2"
  
  ami_id = module.ami_amazon_linux.ami_id
  # ... other EC2 config
}
*/

