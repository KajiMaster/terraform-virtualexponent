data "terraform_remote_state" "global_ecr" {
  backend = "remote"

  config = {
    organization = "VirtualExponent"
    workspaces = {
      name = "global-ecr-all"
    }
  }
}

data "terraform_remote_state" "global_s3" {
  backend = "remote"

  config = {
    organization = "VirtualExponent"
    workspaces = {
      name = "global-s3-${var.env}"
    }
  }
}

data "terraform_remote_state" "global_vpc" {
  backend = "remote"

  config = {
    organization = "VirtualExponent"
    workspaces = {
      name = "global-vpc-${var.env}"
    }
  }
}