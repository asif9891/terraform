resource "aws_key_pair" "Deployer" {
    key_name   = "deployer_key"
    public_key = file("deployer_key.pub")
}

resource "aws_default_vpc" "My_group"{

}

resource "aws_security_group" "My_security_group" {
  name        = "My_security_group"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "ec2_instance"{
    key_name = aws_key_pair.Deployer.key_name
    ami = var.My_ami_id
    instance_type = var.aws_instance_type
    vpc_security_group_ids = [aws_security_group.My_security_group.id]

    root_block_device {
        volume_size = var.aws_storage_set
        volume_type = "gp3"
    }

    tags = {
        Name = var.My_instance_name
    }
}