variable "db_password" {
  description = "Senha do usuário Postgres workshop_os. Sensível, sem default — passar via TF_VAR_db_password ou um .tfvars não versionado."
  type        = string
  sensitive   = true
}

variable "postgres_docker_image" {
  description = "Imagem Docker do Postgres. Mesma versão usada em docker-compose.yml e k8s/postgres.yaml (Fase 2) — sem mudança de engine/versão nesta fase."
  type        = string
  default     = "postgres:16-alpine"
}
