# ============================================
# EXAMPLE: Simple Amazon Linux 
# ============================================

module "ami_amazon_linux" {
  source = "../../../"

  os_type         = "amazon-linux"
  ami_owners      = ["533267218601"]
  ami_name_filter = "amzn-demo"
  most_recent     = true
  ami_tag_filters = {
    environment = "dev"
    team        = "platform"
    version     = "1.1.1"
  }
}

# Use in EC2 module
/*module "ec2" {
  source = "../../modules/ec2"
  
  ami_id = module.ami_amazon_linux.ami_id
  # ... other EC2 config
}
*/

