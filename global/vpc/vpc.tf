module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "vpc-${var.env}"

  azs = var.azs

  cidr = "192.168.0.0/16"

  enable_dhcp_options      = true
  dhcp_options_domain_name = "us-west-1.compute.internal"

  enable_nat_gateway = false
  single_nat_gateway = true

  create_database_subnet_group = false

  default_security_group_name = "sg-${var.env}"

  reuse_nat_ips = true

  default_security_group_ingress = [
    {
      description = "Allow all inbound traffic from the VPC"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      self        = true
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  default_security_group_egress = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      self        = false
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  public_subnets  = ["192.168.1.0/24", "192.168.3.0/24"]
  private_subnets = ["192.168.2.0/24", "192.168.4.0/24"]

  tags = local.default_tags
}