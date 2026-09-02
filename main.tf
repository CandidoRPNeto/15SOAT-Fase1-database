# Hierarquia Dokploy: project > environment > service. Este repositório é o
# dono do dokploy_project compartilhado com workshop-os-infra-kubernetes
# (Epic 3 consome project_id/environment_id via outputs.tf, ver RFC-002 em
# 15SOAT-Fase1/docs/architecture/rfcs/rfc-002-managed-database-strategy.md
# §"Hierarquia e ownership") — decisão tomada aqui porque o Epic 2 (banco)
# precede o Epic 3 (app) na ordem de dependência do backlog.
resource "dokploy_project" "workshop_os" {
  name        = "workshop-os"
  description = "Workshop OS — Fase 3 (gerenciado via Terraform, ver 15SOAT-Fase1)"
}

# Todo dokploy_project já nasce com um environment "production" — não criar
# um dokploy_environment novo. Seleciona por nome, não por índice: a ordem
# de `environments` não é garantida (ver getting-started.md do provider).
locals {
  production_environment_id = [
    for e in dokploy_project.workshop_os.environments : e.id
    if e.name == "production"
  ][0]
}

resource "dokploy_postgres" "workshop_os" {
  name              = "workshop-os-postgres"
  environment_id    = local.production_environment_id
  database_name     = "workshop_os"
  database_user     = "workshop_os"
  database_password = var.db_password
  docker_image      = var.postgres_docker_image
}
