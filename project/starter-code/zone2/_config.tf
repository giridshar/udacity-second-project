terraform {
   backend "s3" {
     bucket = "udacity-giridharsw"
     key    = "terraform/terraform.tfstate"
     region = "us-west-1"
   }
 }

 provider "aws" {
   region = "us-west-1"
 #  profile = "default"
   
   default_tags {
     tags = local.tags
   }
 }
