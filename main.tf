provider "aws" {
        region = "${var.region}"
        profile = "default"
        }

#Creating the launch configuration

resource "aws_launch_configuration" "nv-dev-launch-config" {
        name = "nv-dev-watermark-launch-config-${var.Version}"
        image_id = "${var.ami_id}"
        instance_type = "${var.instance_type}"
        security_groups = ["${var.security_groups}"]
        key_name = "My_linux_new"
        iam_instance_profile = "${var.iam_role}"
        ebs_optimized = "false"
        associate_public_ip_address = "true"
        user_data = "${file("user-data.sh")}"
        lifecycle {
                create_before_destroy = true
                prevent_destroy = true

        }
        }

# Creating Autoscaling Group

resource "aws_autoscaling_group" "nv-dev-watermark-asg" {
        name = "nv-dev-watermark-asg"
        availability_zones = ["${var.avaliblity_zone}"]
        launch_configuration = "${aws_launch_configuration.nv-dev-launch-config.id}"
        vpc_zone_identifier = ["${var.subnet_id}"]
        desired_capacity   = "${var.desired_count}"
        min_size = "${var.min_size}"
        max_size = "${var.max_size}"
        health_check_type = "ELB"
        load_balancers = ["${var.load_balancers}"]
        tag = [
         {
           key                 = "Name"
           value               = "nv-dev-watermark"
           propagate_at_launch = true
         },
          {
            key                 = "Project"
            value               = "reveal-dev"
            propagate_at_launch = true
         }
        ]
        lifecycle {
                create_before_destroy = true

        }
}
