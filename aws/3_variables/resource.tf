resource "aws_instance" "myawsserver1" {
  ami = var.ami["us-east-1"]
  instance_type = var.instance_type
  provider = aws.useast1
  tags = {
    Name = "Techlanders-aws-ec2-instance1"
    Env = "Prod"
  }
}

output "myawsserver1-ip" {
  value = aws_instance.myawsserver1.public_ip
}

resource "aws_instance" "myawsserver2" {
  ami = var.ami["us-east-2"]
  provider = aws.useast2
  instance_type = var.instance_type

  tags = {
    Name = "Techlanders-aws-ec2-instance2"
    Env = "Prod"
  }
}

output "myawsserver2-ip" {
  value = aws_instance.myawsserver2.public_ip
}
