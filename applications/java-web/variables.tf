locals {
  default_tags = {
    Environment = "${var.env}"
    ManagedBy   = "Terraform"
  }
}

variable "aws_account" {
  description = "The root module will deploy to this account."
  type        = string
}

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  description = "The root module will deploy resources to this region"
  type        = string
}

variable "azs" {
  description = "Availability Zones in Service Health"
  type        = list(string)
}

variable "env" {
  type = string
}