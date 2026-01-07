# ============================================
# EXAMPLE: Simple Amazon Linux 
# ============================================

module "ami_amazon_linux" {
  source = "../../module"

  os_type         = "custom"
  ami_owners      = ["533267218601"]
  ami_name_filter = "amzn-demo"
  
}

module "ami_windows" {
  source = "../../module"

  os_type         = "custom"
  ami_owners      = ["533267218601"]
  ami_name_filter = "windows-2025"
  
}

/*module "ami_rhel" {
  source = "../../module"

  os_type         = "rhel"
  ami_owners      = ["533267218601"]
  ami_name_filter = "rhel-demo"
  most_recent     = true
  /*ami_tag_filters = {
    environment = "dev"
    os_version  = "10"
    base_os     = "rhel-10"
  }*/
  /*architecture        = "x86_64"
  virtualization_type = "hvm"
  root_device_type    = "ebs"*/
//}

# Use in EC2 module
/*module "ec2" {
  source = "../../modules/ec2"
  
  ami_id = module.ami_amazon_linux.ami_id
  # ... other EC2 config
}
*/

