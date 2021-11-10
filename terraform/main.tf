provider "aws" {

   region     = "us-east-1"  

}

resource "aws_instance" "ec2_example" {

    ami                    = "ami-083654bd07b5da81d"  
    instance_type          = "t2.micro" 
    key_name               = "id_rsa"
    vpc_security_group_ids = [aws_security_group.main.id]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "mini"
      private_key = file("/Users/mini/.ssh/id_rsa")

   }
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

resource "aws_key_pair" "deployer" {

  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6qzXkfNBXDWMM3pyjJOTPpry7jEO0Kg4axZJBxY3WhpJH7/O43HuPPjwwCCI8DvBiSuPh8vtx96qTxr9lIb//nTPFDogAImPDbZIgmpgSi5KQKk/dS/6ttnEuF+kTsBtuuUbG2kZbBAR8we937USCJqJ2RXuJlq8Ek8PJhsNSU4FA+f0mnHQx2njzFsOBOwZZ7nW9WLb5cMyD9QMpfHgUqdwX3CYZs4EV6Q41eXfRAEaXYiWJEIlx61Di9vaIoi/a8fRpMpsXdOdWHsj28cm5r2cC5kXUqST//QyUHR7gmxpLDYLmF5mZLdp45PZW9xhycQRBp3zH1bjYUC2FbzK4VwAyv0MKj5U+nmuja12yOuFnnhivbGdz6r7POeKYmpEnxpcL0A7CkQA0tpkKOZPLRXE0bsLAHpcp1K2L06PrhYFqwvVhVJflTcm0bPj7C/wlyiK7gh3YJvCrUwI7/Iebwf6Tho3Dm2zYBuvoDU5D04vDvjiqzZFetJt6DLw7qXE= mini@MacBook-Air-mini.local"

}