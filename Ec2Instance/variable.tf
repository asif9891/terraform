variable "My_instance_name"{
    default = "My_first_ec2_instance"
    type = string
}

variable "aws_storage_set" {
    default = "10"
    type = string
}

variable "aws_instance_type" {
    default = "t3.micro"
    type = string
}

variable "My_ami_id" {
    default = "ami-0c0a551d0459e9d39"  # Example AMI ID, replace with a valid one for your region
    type = string
}