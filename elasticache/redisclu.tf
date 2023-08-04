provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region
}

resource "aws_vpc" "example" {
  cidr_block = "172.31.0.0/16"  # Replace with your desired VPC CIDR block
}


resource "aws_security_group" "example" {
  name_prefix = "ec2-rds-6"

  # Add your security group rules here if needed.
}

resource "aws_elasticache_subnet_group" "example" {
  name       = "redis-subnet-group"
  subnet_ids = [aws_subnet.example.id]
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = "my-redis-cluster"
  engine               = "redis"
  engine_version       = "6.x"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  subnet_group_name = aws_elasticache_subnet_group.example.name
  security_group_ids = [aws_security_group.example.id]

  # Disable multi-AZ and auto-failover
  multi_az_enabled            = false
  automatic_failover_enabled  = false
  at_rest_encryption_enabled  = false
  transit_encryption_enabled = false
  auto_minor_version_upgrade  = false
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.example.cache_nodes.0.address
}
