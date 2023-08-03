terraform 
# main.tf

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
  default     = "my-unique-bucket-name"  # Replace with your desired bucket name
}

variable "region" {
  type        = string
  description = "The AWS region where the S3 bucket will be created."
  default     = "ap-south-1"  # Replace with your desired AWS region
}

# terraform.tfvars

bucket_name = "my-bucket-name"  # Replace with your desired bucket name
region      = "ap-south-1"     # Replace with your desired AWS region
