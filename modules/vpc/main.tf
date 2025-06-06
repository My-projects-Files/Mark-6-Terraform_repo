resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { 
    Name = var.vpc_tag
   }
}

# Create subnets in your VPC
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_1_cidr
  availability_zone       = var.subnet_1_az
  map_public_ip_on_launch = true
  tags = {
        Name = var.subnet_1_tag
        }
}

resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_2_cidr
  availability_zone       = var.subnet_2_az
  map_public_ip_on_launch = true
  tags = {
        Name = var.subnet_2_tag
        }
}
