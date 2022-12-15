#--- fractionableinfra my creds---

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
  region  = "us-west-2"
  access_key = "AKIAUAFWSLZ575BYGMPY"
  secret_key = "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"
}
