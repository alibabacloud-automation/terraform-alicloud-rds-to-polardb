#vpc
name = "update-tf-test-rds-to-polardb"

#alicloud_slb_load_balancer
slb_spec      = "slb.s2.medium"
slb_tags_info = "update_slb_tags_info"

#alicloud_eip
eip_bandwidth = 15

#alicloud_instance
system_disk_name           = "test_system_disk"
system_disk_description    = "test_system_disk_description"
internet_max_bandwidth_out = "20"

#alicloud_polardb_cluster
polardb_cluster_description = "update_polardb_cluster_description"

#alicloud_db_instance
instance_storage  = "50"
monitoring_period = "5"