variable "instance_tags" {
    type = list
    default = ["PROD_SERVER", "TEST_SERVER"]
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
    type = string
    default = "id_rsa"
}