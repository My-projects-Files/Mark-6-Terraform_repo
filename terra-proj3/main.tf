
provider "aws" {
	region = "us-east-1"  # Choose your region
}
# Create a VPC (if you don't already have one)
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MainVPC"
   }
}

# Create subnets in your VPC
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
	Name = "subnet 1"
	}
}

resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
	Name = "subnet 2"
	}
}

# Create a DB Subnet Group
resource "aws_db_subnet_group" "db_sub_group" {
  name       = "db_sub_group"
  subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

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

		vpc_security_group_ids = [aws_security_group.rds_sg.id]
	
		  tags = {
			  name = "myRDSinstance"
		}
		
		backup_retention_period = 7
		multi_az = false
}
