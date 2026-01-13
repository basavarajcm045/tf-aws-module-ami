
# ============================================
# EXAMPLE: with Custom Owner
# ============================================

module "ami_windows" {
  source = "../../../module"

  ami_owners      = ["533267218601"]
  ami_name_filter = "windows-2025"

}

resource "aws_instance" "main" {
  ami           = module.ami_windows.ami_id
  instance_type = "t3.micro"

}

# Use in EC2 module
/*module "ec2" {
  source = "../../../modules/ec2"
  
  ami_id = module.ami_windows.ami_id
  # ... other EC2 config
}*/


