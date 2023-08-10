locals {
  env = var.env

  # glboal/ecr remote_state outputs

  ecr_arn = data.terraform_remote_state.global_ecr.outputs.ecr_arn
  ecr_repository_url = data.terraform_remote_state.global_ecr.outputs.ecr_repository_url

  # global/s3 remote_state outputs

  important_bucket_id  = data.terraform_remote_state.global_s3.outputs.important_bucket_id
  important_bucket_arn = data.terraform_remote_state.global_s3.outputs.important_bucket_arn

  # global/vpc remote_state outputs
  azs = data.terraform_remote_state.global_vpc.outputs.azs

  vpc_id = data.terraform_remote_state.global_vpc.outputs.vpc_id

  public_subnet_ids  = data.terraform_remote_state.global_vpc.outputs.public_subnet_ids
  public_subnet_arns = data.terraform_remote_state.global_vpc.outputs.public_subnet_arns

  private_subnet_ids  = data.terraform_remote_state.global_vpc.outputs.private_subnet_ids
  private_subnet_arns = data.terraform_remote_state.global_vpc.outputs.private_subnet_arns

  public_subnets_cidr_blocks  = data.terraform_remote_state.global_vpc.outputs.public_subnets_cidr_blocks
  private_subnets_cidr_blocks = data.terraform_remote_state.global_vpc.outputs.private_subnets_cidr_blocks

  # Tags
  default_tags = {
    Environment = "${var.env}"
    ManagedBy   = "Terraform"
  }
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