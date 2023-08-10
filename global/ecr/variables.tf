locals {
  default_tags = {
    ManagedBy   = "Terraform"
  }
}

variable "aws_region" {
  description = "The root module will deploy resources to this region"
  type        = string
}