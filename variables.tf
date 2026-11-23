
# VPC ID
variable "vpc_id" {
  description = "VPC ID created by Terraform"
  type        = string
  default     = null
}

# Public Subnets
variable "public_subnets" {
  description = "Public subnet IDs created by Terraform"
  type        = list(string)
  default     = []
}
