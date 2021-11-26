data "alicloud_polardb_zones" "default" {
}

data "alicloud_images" "default" {
  name_regex = "^centos_6"
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_polardb_zones.default.zones.0.id
}

data "alicloud_polardb_node_classes" "default" {
  pay_type   = var.pay_type
  db_type    = "MySQL"
  db_version = "8.0"
  zone_id    = data.alicloud_polardb_zones.default.zones.0.id
}

data "alicloud_db_instance_classes" "default" {
  engine         = "MySQL"
  engine_version = "8.0"
}

module "example" {
  source = "../.."

  #vpc
  name              = var.name
  vpc_cidr_block    = "172.16.0.0/16"
  vs_cidr_block     = "172.16.0.0/21"
  availability_zone = data.alicloud_polardb_zones.default.zones.0.id

  #alicloud_slb_load_balancer
  slb_address_type = "intranet"
  slb_spec         = var.slb_spec
  slb_tags_info    = var.slb_tags_info

  #alicloud_eip
  eip_bandwidth            = var.eip_bandwidth
  eip_internet_charge_type = "PayByBandwidth"

  #alicloud_instance
  instance_type              = data.alicloud_instance_types.default.instance_types.0.id
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = data.alicloud_images.default.images.0.id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks_name            = "data_disks_name"
  ecs_size                   = 1200
  category                   = "cloud_efficiency"
  description                = "tf-vpc-ecs-description"
  encrypted                  = true

  #alicloud_polardb_cluster
  db_type                     = "MySQL"
  db_version                  = "8.0"
  pay_type                    = var.pay_type
  db_node_class               = data.alicloud_polardb_node_classes.default.classes.0.supported_engines.0.available_resources.0.db_node_class
  polardb_cluster_description = var.polardb_cluster_description

  #alicloud_polardb_database
  db_name = "tf-db-name"

  #alicloud_db_instance
  engine               = "MySQL"
  engine_version       = "8.0"
  rds_instance_type    = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  monitoring_period    = var.monitoring_period

}
