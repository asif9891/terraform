variable "aws_storage_set"{
    default = "10"
    type = string
}

variable "aws_region" {
    default = "us-east-2"
    type = string
}

variable "aws_instance_type" {
    default = "t2.micro"
    type = string
}

variable "aws_ami" {
    default = "ami-0c0a551d0459e9d39" # Example AMI ID for Amazon Linux 2 in us-east-1, change as needed
    type = string   
  
}