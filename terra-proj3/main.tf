
provider "aws" {
	region = "us-east-1"  # Choose your region
}

module "vpc" {
	source = "../modules/vpc"
	vpc_cidr = "10.0.0.0/16"
	subnet_1_cidr = "10.0.1.0/24"
	subnet_2_cidr = "10.0.2.0/24"
	subnet_1_az = "us-east-1a"
	subnet_2_az = "us-east-1b"
}

# Create a DB Subnet Group
resource "aws_db_subnet_group" "db_sub_group" {
  name       = "db_sub_group"
  subnet_ids = [module.vpc.subnet1_id, module.vpc.subnet2_id]

  tags = {
    Name = "db_sub_group"
  }
}

module "rds_sg" {
	source = "../modules/security_group"
	sg_name = "rds_security_group"
	des_val = "Allow inbound traffic to RDS from specific IPs"
	ing_from_val = 5432
	ing_to_val = 5432

	tags = {
   	  Name = "RDS-SecurityGroup"
  	}
}
	
resource "aws_db_instance" "default" {
  		allocated_storage    = 10
  		engine               = "mysql"
  		engine_version       = "8.0.34"
  		instance_class       = "db.t2.micro"
  		db_name              = "mydb"
  		username             = "mydbusr"
  		password             = "ad@123"
  		db_subnet_group_name = aws_db_subnet_group.db_sub_group.name
  		parameter_group_name = "default.mysql8.0"

		vpc_security_group_ids = [module.rds_sg.sg_id]
	
		  tags = {
			  name = "myRDSinstance"
		}
		
		backup_retention_period = 7
		multi_az = false
}
