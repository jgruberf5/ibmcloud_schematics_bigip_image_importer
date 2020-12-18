data ibm_resource_group "group" {
  name = var.resource_group
}

# get the public image COS SQL url and default name
data "external" "f5_public_image" {
  program = ["python", "${path.module}/image_selector.py"]
  query = {
      download_region = var.download_region
      version_prefix = var.tmos_version
      type = var.tmos_image_type
  }
}

locals {
  vpc_image_name = var.vpc_image_name == "" ? data.external.f5_public_image.result.image_name : var.vpc_image_name
}

resource "ibm_is_image" "vpc_custom_image" {
  name = local.vpc_image_name
  resource_group = data.ibm_resource_group.group.id
  href = data.external.f5_public_image.result.image_sql_url
  operating_system = "centos-7-amd64"
}

output "vpc_image_name" {
  value = ibm_is_image.vpc_custom_image.name
}

output "vpc_image_id" {
  value = ibm_is_image.vpc_custom_image.id
}

output "vpc_image_status" {
  value = ibm_is_image.vpc_custom_image.status
}