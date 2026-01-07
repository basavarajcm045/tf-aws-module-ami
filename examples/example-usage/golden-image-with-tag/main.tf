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
}

# Use in EC2 module
/*module "ec2" {
  source = "../../modules/ec2"
  
  ami_id = module.ami_amazon_linux.ami_id
  # ... other EC2 config
}
*/

