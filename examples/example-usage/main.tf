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

# Use in EC2 module
/*module "ec2" {
  source = "../../modules/ec2"
  
  ami_id = module.ami_amazon_linux.ami_id
  # ... other EC2 config
}
*/

