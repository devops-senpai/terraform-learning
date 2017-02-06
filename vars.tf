provider "aws" {
    region = "${var.AWS_REGION}"
}
variable "ENVIRONMENT" {
    default = "dev"
}
variable "AZ" {
    default = "a"
}
variable "AWS_REGION" {
	default = "us-east-1"
}
variable "AWS_AZ" {
	type = "map"
	default {
		a = "us-east-1a"
		b = "us-east-1b"
	}
}
variable "AMIS" {
	type = "map"
	default {
		us-east-1 = "ami-3b7f9e2d"
		us-east-2 = "ami-e66d4883"
	}
}
variable "vpc_base_cidr" {
	type = "map"
	default {
                dev = "10.1"
		stage = "10.2"
		prod = "10.3"
	}
}
