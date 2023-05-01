resource "aws_elasticache_replication_group" "redis_replica" {
  automatic_failover_enabled  = true
  preferred_cache_cluster_azs = ["us-east-1a", "us-east-1b"]
  replication_group_id        = "${var.product}-redis-group-1"
  description                 = "${var.product} redis cluster"
  node_type                   = "cache.t2.micro"
  engine_version              = "6.x"
  num_cache_clusters          = 2
  parameter_group_name        = "default.redis6.x"
  port                        = 6379
  subnet_group_name           = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids          = [aws_security_group.redis_security_group.id]
  multi_az_enabled            = true

  tags = {
    Name        = "${var.product} redis replica"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_elasticache_cluster" "redis_cluster" {
  count = 1

  cluster_id           = "${var.product}-redis-group-${count.index}"
  replication_group_id = aws_elasticache_replication_group.redis_replica.id
}
