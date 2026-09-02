# Consumidos manualmente pelo Epic 3 (15SOAT-Fase1-kubernetes) até
# existir um backend remoto compartilhado — lacuna documentada em RFC-002,
# não um `terraform_remote_state` automático.
output "project_id" {
  description = "Id do dokploy_project compartilhado — usado pelo Epic 3 para anexar o recurso de app ao mesmo projeto."
  value       = dokploy_project.fase1.id
}

output "environment_id" {
  description = "Id do environment 'production' compartilhado — usado pelo Epic 3 para anexar o recurso de app ao mesmo environment do banco."
  value       = local.production_environment_id
}

output "postgres_id" {
  description = "Id do serviço Postgres provisionado."
  value       = dokploy_postgres.fase1.id
}

output "postgres_status" {
  description = "Status do serviço Postgres reportado pelo Dokploy."
  value       = dokploy_postgres.fase1.status
}
