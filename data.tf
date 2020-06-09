# Get the latest ECS AMI
data "aws_ami" "latest_ecs" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # AWS
}

# User data for ECS cluster
data "template_file" "ecs-cluster" {
  template = "${file("ecs-cluster.tpl")}"

  vars = {
    ecs_cluster = "${aws_ecs_cluster.demo.name}"
  }
}


# Setting S3 for remote state file

/* data "terraform_remote_state" "terraform-state-buck" {
  backend = "s3"
  config = {
    bucket = "terraform-state-buck"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
} */