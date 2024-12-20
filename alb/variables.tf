variable "name" {
    description = "ALB Name"
    type = string
}

variable "subnets" {
    description = "ALB Subnets"
    type = list(string)
}

variable "certificate_arn" {
    description = "ALB ACM Certificate ARN"
    type = string
}

variable "vpc_id" {
    description = "ALB VPC ID"
    type = string
}

variable "target_id" {
    description = "Target Instance ID"
    type = string
}