variable "name" {
  default = "terraform_test"
}

data "alicloud_zones" "default" {
  available_resource_creation = "PolarDB"
  enable_details              = true
}

module "example" {
  source            = "../"
  name              = var.name
  availability_zone = data.alicloud_zones.default.zones.0.id
  instance_type     = "ecs.n4.large"
  db_version        = "8.0"
  db_node_class     = "polar.mysql.x4.large"
  rds_instance_type = "rds.mysql.s3.large"
  engine_version    = "5.6"
}
