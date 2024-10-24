variable "instance_type" {
    description = "EC2 Instance Type"
    type = string
}

variable "user_data" {
    description = "Instance user data"
    type = string
}

variable "ami" {
    description = "Amazon instance image"
    type = string
}

variable "subnet_id" {
    description = "EC2 instance subnet Id"
}

variable "tags" {
    description = "EC2 Instance Tags"
    type = map(string)
}

variable "vpc_security_group_ids" {
    description = "EC2 Instance VPC Security Groups"
    type = list(string)
}