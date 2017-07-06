provider "aws" {
  region = "eu-west-1",
  profile = "karl"
}

resource "aws_elastic_beanstalk_application" "eb-dotnet-spike" {
  name        = "eb-dotnet-spike"
  description = "elastic beanstalk example"
}

resource "aws_elastic_beanstalk_environment" "eb-dotnet-spike-dev" {
  name                = "eb-dotnet-spike-dev"
  application         = "${aws_elastic_beanstalk_application.eb-dotnet-spike.name}"
  solution_stack_name = "64bit Windows Server 2012 R2 v1.2.0 running IIS 8.5"
  tier                = "WebServer"

  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = "/status"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "Rolling"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = "Percentage"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "33"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "zuto-dev"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "4"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "Environment"
    value     = "My really cool dev env"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "HealthCheckPath"
    value     = "/status"
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "HealthyThreshold"
    value     = 2
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "UnhealthyThreshold"
    value     = 3
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "Interval"
    value     = 10
  }

  setting {
    namespace = "aws:elasticbeanstalk:hostmanager"
    name      = "LogPublicationControl"
    value     = "true"
  }
}
