# Provider pinado em versão exata: pré-1.0, breaking changes chegam em
# minor releases até v1.0.0 (ver docs do provider). Justificativa da
# escolha do provider (entre os vários forks comunitários do ecossistema
# Dokploy) em 15SOAT-Fase1/docs/architecture/rfcs/rfc-002-managed-database-strategy.md.
terraform {
  required_version = ">= 1.5"

  required_providers {
    dokploy = {
      source  = "vanillauys/dokploy"
      version = "0.10.2"
    }
  }
}

# endpoint/api_key não têm default aqui de propósito — vêm de
# DOKPLOY_ENDPOINT/DOKPLOY_API_KEY (variáveis de ambiente), nunca de
# arquivo versionado. Ver variables.tf e o guia "Secrets and sensitive
# values" do provider.
provider "dokploy" {}
