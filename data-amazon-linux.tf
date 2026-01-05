#Amazon Linux AMI data sources

data "aws_ami" "amazon_linux" {
  count = var.os_type == "amazon-linux" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["amzn2-ami-hvm-*-${var.architecture}-gp2"]
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

  # Optional: Filter by OS version tag
  /*dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:version"
      values = [filter.value]
    }
  }*/

  # Additional custom tag filters
  dynamic "filter" {
    for_each = var.ami_tag_filters
    content {
      name   = "tag:${filter.key}"
      values = [filter.value]
    }
  }
}

#========== AMAZON LINUX 2 ==========
/*
data "aws_ami" "amazon_linux_2" {
  count = var.os_type == "amazon-linux-2" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["amzn2-ami-hvm-*-${var.architecture}-gp2"]
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

  # Optional: Filter by OS version tag
  dynamic "filter" {
    for_each = var.os_version != null ? [var.os_version] : []
    content {
      name   = "tag:version"
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

#========== AMAZON LINUX 2023 ==========

data "aws_ami" "amazon_linux_2023" {
  count = var.os_type == "amazon-linux-2023" ? 1 : 0

  most_recent = var.most_recent
  owners      = var.ami_owners != null ? var.ami_owners : ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = var.ami_name_filter != null ? [var.ami_name_filter] : ["al2023-ami-*-${var.architecture}"]
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
}*/