#========== CENTOS 7 ==========

data "aws_ami" "centos_7" {
  count = var.os_type == "centos-7" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["125523088429"] # CentOS.org

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["CentOS*7*${var.architecture}*"]
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }

  filter {
    name   = "virtualization-type"
    values = [var.virtualization_type]
  }

  filter {
    name   = "root-device-type"
    values = [var.root_device_type]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }

  # Optional: Filter by OS version tag
  dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:Version"
      values = [filter.value]
    }
  }

  # Additional custom tag filters
  dynamic "filter" {
    for_each = var.ami_tag_filters
    content {
      name   = "tag:${filter.key}"
      values = [filter.value]
    }
  }
}
