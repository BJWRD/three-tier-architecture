terraform {
  required_version = "1.3.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.50.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-dev-bucket"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}