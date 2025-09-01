variable "env" {
    description = "The environment name (e.g., dev, prod)"
    type        = string
}

variable "vpc_cicr_block" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "availability_zones" {
    description = "A list of availability zones to use"
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
    description = "A list of CIDR blocks for private subnets"
    type        = list(string)
}

variable "public_subnets" {
    description = "A list of CIDR blocks for public subnets"
    type        = list(string)
}

variable "private_subnet_tags" {
    description = "A map of tags to add to private subnets"
    type        = map(string)
}

variable "public_subnet_tags" {
    description = "A map of tags to add to public subnets"
    type        = map(string)
}