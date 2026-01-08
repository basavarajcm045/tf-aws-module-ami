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