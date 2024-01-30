# networking variables
variable "vpc_name" {
  type        = string
  description = "VPC Name"
}
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Values"
}
variable "public_cidr" {
  type        = list(string)
  description = "Public Subnet CIDR Values"
}
variable "us_az" {
  type        = list(string)
  description = "Availability Zones"
}

variable "ACCESS_KEY" {
  type        = string
  description = "AWS Access Key"
}
variable "SECRET_KEY" {
  type        = string
  description = "AWS Secret Key"
}
variable "vm_public_key" {
  type        = string
  description = "eurusvm-jenkinsvm public key"
}
