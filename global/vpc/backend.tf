terraform {
  cloud {
    organization = "VirtualExponent"
    workspaces {
      tags = ["ve", "aws"]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}