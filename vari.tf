variable "region" {
  default = "us-west-2"
}
variable "security_groups" {
  default = "sg-0ae26b0d844a1f4b3"
}
variable "Ami_ID" {
  default = "$ami-id"
}
variable "subnet_id" {
  default = "subnet-0d4a269bf1aa7051c"
}
variable "load_balancers" {
  default = "mytest"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "desired_count" {
  default = "1"
}
variable "min_size" {
  default = "1"
}
variable "max_size" {
  default = "4"
}
variable "avaliblity_zone" {
        type = "list"
        default = ["us-west-2a","us-west-2b"]
}
variable "iam_role" {
        default = "admin_access"
}
