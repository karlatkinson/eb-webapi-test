provider "aws" {
  region = "eu-west-1"
}

resource "aws_elastic_beanstalk_application" "eb-dotnet-spike" {
  name        = "eb-dotnet-spike"
  description = "elastic beanstalk example"
}


resource "aws_elastic_beanstalk_environment" "eb-dotnet-spike-dev" {
  name                = "eb-dotnet-spike-dev"
  application         = "${aws_elastic_beanstalk_application.eb-dotnet-spike.name}"
  solution_stack_name = "64bit Windows Server 2012 R2 v1.2.0 running IIS 8.5"

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "DeploymentPolicy"
    value = "Rolling"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Percentage"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "33"
  }
}
