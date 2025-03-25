output "this_ecs_id" {
  description = "The ID of the ecs."
  value       = alicloud_instance.default.id
}

output "this_ecs_name" {
  description = "The name of the ecs."
  value       = alicloud_instance.default.instance_name
}

output "this_polardb_database_id" {
  description = "The ID of the polardb database."
  value       = alicloud_polardb_database.default.id
}

output "this_polardb_database_name" {
  description = "The name of the polardb database."
  value       = alicloud_polardb_database.default.db_name
}

output "this_slb_id" {
  description = "The ID of the slb."
  value       = alicloud_slb_load_balancer.default.id
}

output "this_slb_name" {
  description = "The name of the slb."
  value       = alicloud_slb_load_balancer.default.load_balancer_name
}

output "this_eip_id" {
  description = "The ID of the eip."
  value       = alicloud_eip.default.id
}
