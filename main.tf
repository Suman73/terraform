# main.tf

terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"  # Replace with the desired version constraint for the AWS provider
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Production"
  }
}

# variables.tf

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket."
  default     = "sumanbucket1983746981"  # Replace with your desired bucket name
}

variable "region" {
  type        = string
  description = "The AWS region where the S3 bucket will be created."
  default     = "ap-south-1"  # Replace with your desired AWS region
}

