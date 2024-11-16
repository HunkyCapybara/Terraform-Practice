resource "aws_db_instance" "rds" {
  engine                 = var.main_Engine
  engine_version         = var.main_Engineversion
  identifier             = var.main_identifier
  instance_class         = var.main_instanceclass
  username               = var.main_username
  password               = var.main_password
  storage_type           = "gp2"
  allocated_storage      = 20
  publicly_accessible    = "true"
  skip_final_snapshot    = false
  backup_retention_period = 7
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

resource "aws_security_group" "rds_sg" {
    name = "rds_sg"
    vpc_id = "vpc-0221cb28d1552461d"


    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_db_instance" "rds_replica" {
    count                   = 1
    replicate_source_db     = aws_db_instance.rds.id
    identifier = "replica"
    instance_class          = var.main_instanceclass
    skip_final_snapshot     = false
    backup_retention_period = 7
    vpc_security_group_ids  = [aws_security_group.rds_sg.id]
}
