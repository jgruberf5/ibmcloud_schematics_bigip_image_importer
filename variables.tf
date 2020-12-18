##################################################################################
# region - The VPC region to create the TMOS VPC Custom Image
##################################################################################
variable "region" {
  type        = string
  default     = "us-south"
  description = "The VPC region to create the TMOS VPC Custom Image"
}

# Present for CLI testng
#variable "api_key" {
#  type        = string
#  default     = ""
#  description = "IBM Public Cloud API KEY"
#}

##################################################################################
# resource_group - The IBM Cloud resource group to create the TMOS VPC Custom Image
##################################################################################
variable "resource_group" {
  type        = string
  default     = "default"
  description = "The IBM Cloud resource group to create the TMOS VPC Custom Image"
}

##################################################################################
# download_region - The VPC region to Download the Public TMOS COS Image
##################################################################################
variable "download_region" {
  type        = string
  default     = "us-south"
  description = "The VPC region to Download the Public TMOS COS Image"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['us-south', 'us-east', 'eu-gb', 'eu-de', 'jp-tok', 'au-syd'], var.download_region)
  #  error_message = "download_region must be a public VPC region"
  #}
}

##################################################################################
# vpc_image_name - The VPC Custom Image Name
##################################################################################
variable "vpc_image_name" {
  type        = string
  default     = ""
  description = "The VPC Custom Image Name"
}

##################################################################################
# tmos_version - The version of TMOS image to Import
##################################################################################
variable "tmos_version" {
  type        = string
  default     = "15.1"
  description = "The version of TMOS image to Import"
}

##################################################################################
# tmos_image_type - The type of TMOS image to Import
##################################################################################
variable "tmos_image_type" {
  type        = string
  default     = "ltm"
  description = "Select between ltm or all TMOS VE images"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['ltm', 'all'], var.tmos_image_type)
  #  error_message = "tmos_image_type can be ltm or all only"
  #}
}

