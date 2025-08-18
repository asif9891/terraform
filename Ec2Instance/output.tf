output "InstanceId" {
  value = aws_instance.ec2_instance.id
  
}

output "Instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "Instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
  
}

output "Instance_dns_name" {
  value = aws_instance.ec2_instance.public_dns
}