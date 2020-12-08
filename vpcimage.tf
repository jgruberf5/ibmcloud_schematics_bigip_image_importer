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
  vpc_image_name = var.vpc_image_name == "" ? external.f5_public_image.result.image_name : var.vpc_image_name
}

resource "ibm_is_image" "vpc_custom_image" {
  name = local.vpc_image_name
  href = external.f5_public_image.result.image_sql_url
  operating_system = "centos-7-amd64"
}

output "vpc_image_name" {
  value = vpc_custom_image.name
}

output "vpc_image_id" {
  value = vpc_custom_image.id
}

output "vpc_image_crn" {
  value = vpc_custom_image.crn
}

output "vpc_image_status" {
  value = vpc_custom_image.status
}