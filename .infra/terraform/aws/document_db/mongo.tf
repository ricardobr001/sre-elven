resource "aws_db_subnet_group" "mongo_db_subnet_group" {
  name       = "mongo_db_subnet_group"
  subnet_ids = var.db_subnets

  tags = {
    Name        = "${var.product} mongo subnet group"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_docdb_cluster_parameter_group" "mongo_parameter_group" {
  family      = "docdb4.0"
  name        = "gobarber-mongo"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}

resource "aws_docdb_cluster" "mongo" {
  cluster_identifier     = var.product
  master_username        = var.product
  master_password        = var.db_password
  skip_final_snapshot    = true
  apply_immediately      = true
  vpc_security_group_ids = [aws_security_group.db_mongo_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.mongo_db_subnet_group.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.mongo_parameter_group.name

  tags = {
    Name        = "${var.product} mongo db cluster"
    Environment = var.environment
    Terraformed = true
  }
}

resource "aws_docdb_cluster_instance" "mongo_cluster_instances" {
  count              = 2
  identifier         = "docdb-cluster-demo-${count.index}"
  cluster_identifier = aws_docdb_cluster.mongo.id
  instance_class     = "db.t3.medium"

  tags = {
    Name        = "${var.product} mongo db instance"
    Environment = var.environment
    Terraformed = true
  }
}
