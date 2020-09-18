provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myawsserver" {
  ami = "ami-0603cbe34fd08cb81"
  instance_type = "t2.micro"
  key_name = "test"

  tags = {
    Name = "Techlanders-aws-ec2-instance"
    env = "test"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.private_ip} && echo ${self.private_ip} myawsserver >> /etc/hosts"
  }
 provisioner "remote-exec" {
    inline = [
     "touch /tmp/gagandeep",
      "sudo mkdir /root/gagan"
     ]
 connection {
    type     = "ssh"
    user     = "ec2-user"
    insecure = "true"
    private_key = "${file("test.pem")}"
    host     =  aws_instance.myawsserver.public_ip
  }
}

}
output "Server-Public-IP" {
  value = aws_instance.myawsserver.public_ip
}

output "Server-Private-IP" {
 value = aws_instance.myawsserver.private_ip
}
