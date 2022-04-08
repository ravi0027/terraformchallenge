resource "aws_vpc" "aws-vpc" {
  cidr_block = var.vpc_cidr


  tags = {
    Name = var.vpc_name
  }
}



resource "aws_security_group" "aws-security" {
  name = var.security_group_name
  description = "Allow ssh from office"
  vpc_id = aws_vpc.aws-vpc.id
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_security_group" "aws-security" {
  name                 = var.elasticache_security_group_name
  security_group_names = [aws_security_group.aws-security.name]
}



resource "aws_subnet" "aws_subnet" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_zone

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_elasticache_subnet_group" "aws_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = [aws_subnet.aws_subnet.id]
}

resource "aws_elasticache_cluster" "aws_cluster" {
  cluster_id         = var.cluster_id
  engine             = var.cluster_engine
  node_type          = var.cluster_node_type
  num_cache_nodes    = 1
  security_group_ids = ["${aws_elasticache_security_group.aws-security.id}"]
  subnet_group_name  = aws_elasticache_subnet_group.aws_subnet_group.name
  engine_version     = var.engine_version
  port               = var.port
}


