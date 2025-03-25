output "this_ecs_name" {
  description = "The name of the ecs."
  value       = module.example.this_ecs_name
}

output "this_polardb_database_name" {
  description = "The name of the polardb database."
  value       = module.example.this_polardb_database_name
}

output "this_slb_name" {
  description = "The name of the slb."
  value       = module.example.this_slb_name
}
