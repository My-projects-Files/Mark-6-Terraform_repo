terraform {
	provider "aws" {
	region = "us-east-1"  # Choose your region
	}

	resource "aws_security_group" "rds_sg" {
  		name        = "rds_security_group"
  		description = "Allow inbound traffic to RDS from specific IPs"

  		ingress {
    			from_port   = 5432  # PostgreSQL port
    			to_port     = 5432  # PostgreSQL port
    			protocol    = "tcp"
    			cidr_blocks = ["0.0.0.0/0"]  # Allow all IPs for simplicity, but you should restrict this in production
  		}		

  		egress {
    			from_port   = 0
    			to_port     = 0
    			protocol    = "-1"
    			cidr_blocks = ["0.0.0.0/0"]
  		}

  		tags = {
   		Name = "RDS-SecurityGroup"
  		}
	}
	
	resource "aws_db_instance" "default" {
  		allocated_storage    = 10
  		engine               = "postgres"
  		engine_version       = "13.3"
  		instance_class       = "db.t2.micro"
  		db_name              = "mydb"
  		username             = "mydbusr"
  		password             = "ad@123"
  		db_subnet_group_name = "my_database_subnet_group"
  		parameter_group_name = "default.mysql5.6"
	
		tags = {
			name = "myRDSinstance"
		}
		
		backup_retention_period = 7
	}
	
	output "rds_endpoint" {
 		 value = aws_db_instance.default.endpoint
	}

	output "rds_instance_id" {
  		value = aws_db_instance.default.id
	}
	
	

