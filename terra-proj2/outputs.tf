output "instance_public_ip" {
	description = "public ip of the EC2 instance"
	value = aws_instance.my_instance.public_ip
}

output "instance_id" {
	description = "id of the EC2 instance"
	value = aws_instance.my_instance.id
}
