provider "aws" {
   region     = "us-east-1"   
}

resource "aws_instance" "ec2_example" {

    ami = "ami-083654bd07b5da81d"  
    instance_type = "t2.micro" 
    key_name= "test"
    vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
  
 ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [ "0.0.0.0/0", ]
  }

  ingress {
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = [ "0.0.0.0/0", ]
  }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [ "0.0.0.0/0", ]
      
    }
}