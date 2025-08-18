# when we create an ec2 instance, we need to specify the ami, instance type, key name, and security group
resource "aws_key_pair" "My_key" {
    key_name = "Deployer"
    public_key = file("${path.module}/ec2_key.pub")
}

# Create a security group for the EC2 instance by default it allows all traffic
resource "aws_default_vpc" "default_vpc" {
}


resource "aws_security_group" "default_sg" {
  name        = "default_sg"
  description = "Default security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# create an ec2 instance
resource "aws_instance" "my_ec2_instance" {
   ami = var.aws_ami # This is an example AMI ID for Amazon Linux 2 in us-east-1, change it as needed
    instance_type = "t3.micro" # This is an example instance type, change it as needed
    key_name = aws_key_pair.My_key.key_name  # use key pair created above and use with the instance of iunterpolation
    security_groups = [aws_security_group.default_sg.name] # use the security group created above
    root_block_device {
        volume_size = var.aws_storage_set # Size in GB

        volume_type = "gp3" # General Purpose SSD
    }
    tags = {
        Name = "MyEC2Instance"
    }
}
        