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