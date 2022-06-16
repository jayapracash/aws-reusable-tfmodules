#--- ec2-instance/providers.tf---

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
  access_key = "AKIATW7A7PLPOAQZMKWD"
  secret_key = "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"
}
