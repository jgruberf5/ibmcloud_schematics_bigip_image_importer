##################################################################################
# region - The VPC region to Import the TMOS Image
##################################################################################
variable "region" {
  type = string
  default = 'us-south'
  description = "The VPC region to import the TMOS Image"
}

# Present for CLI testng
#variable "api_key" {
#  type        = string
#  default     = ""
#  description = "IBM Public Cloud API KEY"
#}


##################################################################################
# download_region - The VPC region to Download the Public TMOS COS Image
##################################################################################
variable "download_region" {
  type        = string
  default     = "us-south"
  description = "The VPC region to Download the Public TMOS COS Image"
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
}

