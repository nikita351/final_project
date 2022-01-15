resource "aws_instance" "prod_server" {
    ami                    = "ami-083654bd07b5da81d"  
    instance_type          = var.instance_type
    key_name               = var.key_name
    vpc_security_group_ids = [aws_security_group.main.id]

     tags = {
      Name  = "prod_server"
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+3PgeT73AIzcS7hJtDimd/5fL7zViDZM44zPNN1iDhRFNXxzp2/H68cQkqa8LTb3MH6FM092Qkp4Q4MlyZANwRyBMr/Y+7LNH1b1EP5VfI9lZeFVOywrWEgjiJgAdEs++1IuVWIkk0WV8QY4TVA1EwqAYd4gc9f2Tsa/OqW9vsRFuSJyZw/hbW7SEGXANAdY6IqMDeH68ikpcwdMFtMI1YfuQy6zY9C+UT5OjckWLiasTOwaJpyos0xTT40+7/+4cTgBbDLajq9KX/MuA2KqwjWYJqtXNPfrFtlUIKIOzOVzrYhY+Nf6P4oxy+JPTt3eNS/ta2EcyRBq01WDjSOsG42tTswbtyYnII4B28toiUIpAUCB1bcafgu8ukVm8c2K2msVi/Ypa/eXACCUkIPfvCaytGkNdqlhxNXkiV/xvsr5fQigqzm2OM+rZRGgjtp4Nn/zseroczRdGC89U6NosSu63RcdlBkY0VNqvZOU99y+NkENUj4rLonPNAnJqTH8= nikita@EPUAKHAW000B"
}