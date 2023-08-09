output "vpc_id" {
  value = module.vpc.vpc_id
}

output "azs" {
  value = module.vpc.azs
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "public_subnet_arns" {
  value = module.vpc.public_subnet_arns
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "private_subnet_arns" {
  value = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}
