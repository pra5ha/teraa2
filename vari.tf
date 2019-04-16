varible "region" {
  default = "us-west-2"
}
varible "security_groups" {
  default = "sg-0ae26b0d844a1f4b3"
}
varible "Ami_ID" {
  default = "ami-005bdb005fb00e791"
}
varible "subnet_id" {
  default = "subnet-0d4a269bf1aa7051c"
}
varible "load_balancers" {
  default = "mytest"
}
varible "instance_type" {
  default = "t2.micro"
}
varible "desired_count" {
   type    = integer
  default = 1
}
varible "min_size" {
   type    = integer
  default = 1
}
varible "max_size" {
   type    = integer
  default = 4
}
varible "avaliblity_zone" {
        default = ["us-west-2a"]
}
