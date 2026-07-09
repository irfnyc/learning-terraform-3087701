data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "ami-name"
    values = ["aws-elasticbeanstalk-amzn-*.64bit_arm-eb_tomcat11corretto25_amazon_linux_2023-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
