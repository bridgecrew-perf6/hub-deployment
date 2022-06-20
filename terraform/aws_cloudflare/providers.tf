terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
	}
	cloudflare = {
	  source = "cloudflare/cloudflare"
	  version = "~> 3.0"
	}
  }
}

provider "aws" {
  region = "${var.region}"
}

provider "cloudflare" {
}
