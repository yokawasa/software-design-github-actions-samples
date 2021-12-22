terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    #bucket = "YOUR TF STATE BUCKET"
    bucket = "gha-terraform"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
  required_version = ">= 0.14.9"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08455f1340543554c"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleEC2Instance"
  }
}

