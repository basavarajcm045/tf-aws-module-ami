
ami_owner = "533267218601"
ami_name_filter = "amzn-demo"
ubuntu_ami_name_filter = "ubuntu/image"

ami_tag_filters = {
  environment = "dev"
  team        = "platform"
  version     = "1.1.1"
}

ubuntu_ami_tag_filters = {
  environment = "dev"
  os_version  = "24.04"
  base_os     = "ubuntu-24.04"
}

architecture = "x86_64"
ubuntu_architecture = "x86_64"
virtualization_type = "hvm"
ubuntu_virtualization_type = "hvm"
root_device_type = "ebs"
ubuntu_root_device_type = "ebs"
