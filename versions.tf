terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.67.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "seongland"
    workspaces {
      name  = "seongland-tf"
    }
  }
  required_version = ">= 0.14.0"
}
