# networking variables
variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR Values"
}
variable "vpc_name" {
  type        = string
  description = "Devops Project tr-jenkins VPC 1"
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
