

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = var.dns_hostnames

  tags = {
    Name = "main"
  }
}

  

resource "aws_db_instance" "db_inst" {
  identifier             = "dbinst"
  instance_class         = var.instance_class
  allocated_storage      = var.db_memory_size
  engine                 = var.db_engine
  engine_version         = var.db_version
  username               = var.user_name
  password               = var.db_password
  skip_final_snapshot    = true
}

resource "aws_security_group" "db_network" {
  name        = "db_network"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "db_network from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  tags = {
    Name = "db_network"
  }
}

