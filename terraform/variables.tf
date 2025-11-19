variable "aws_region" {
	description = "The AWS region to create things in"
	default = "ap-south-1"
	}

variable "instance_type" {
	description = "EC2 size/ype"
	default = "t2.micro"
}

variable "key_name" {
	description = "your ec2 key pair name"
}

variable "repo_url" {
	description = "your github repo url"
}
