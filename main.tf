resource "aws_instance" "jenkins_server" {
  ami           = "ami-0c55b159cbfafe1f0"  # AWS AMI, replace as needed
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "Jenkins-Server"
  }
}

