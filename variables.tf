variable "vpc_cidr" {
    description = "Test for Terraform-3-tier VPC cidr blocks"
    type        = string
    default     = "94.0.0.0/16"
}

variable "vpc_name" {
    description = "Test for Terraform-3-tier VPC Name Tags"
    type        = string
    default     = "for-TEST-VPC"
}

variable "igw_name" {
    description = "Test for Terraform-3-tier IGW Name Tags"
    type        = string
    default     = "for-TEST-IGW"
}

variable "availability_zone-2" {
    description = "Namining for Terraform-3-tier general-purpose string"
    type        = string
    default     = "availability-zone"
}