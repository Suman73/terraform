
variable "instance_name" {
        description = "tfinstance"
        default = "awsbuilder-demo"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-040e75a6dbdbe0c2e"
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-008b85aa3ff5c1b02"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}


variable "ami_key_pair_name" {
        default = "keymar2"
}




provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
} 