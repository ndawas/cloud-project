# cloud-project

Projet Terraform deployant S3 et DynamoDB sur Floci, un emulateur AWS local.

## Provider choisi

AWS

## Services choisis

- **S3** : stockage objet pour les donnees du projet. Simple, universel, supporte le versioning.
- **DynamoDB** : base de donnees NoSQL serverless. Parfait pour stocker des metadonnees avec une cle de partition.

## Pourquoi ces services

S3 et DynamoDB forment le duo de base de toute architecture AWS. Ils sont stateless, ne necessitent pas de serveur, et sont immediatement disponibles dans Floci sans configuration Docker supplementaire.

## Lancer Floci

```bash
docker compose up -d
```

Verifier que Floci fonctionne :

```bash
curl http://localhost:4566/_floci/health
```

## Lancer Floci UI

Ouvrir dans le navigateur :

http://localhost:4566/_floci/ui


## Configurer Terraform

Le provider AWS pointe vers Floci via un endpoint local :

```hcl
endpoints {
  s3       = "http://localhost:4566"
  dynamodb = "http://localhost:4566"
}
```

Aucun vrai compte AWS n'est necessaire. Les credentials sont fictifs (access_key = "test").

## Deployer

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Verifier dans Floci UI

Ouvrir http://localhost:4566/_floci/ui et naviguer vers Storage et DynamoDB.

## Detruire les ressources

```bash
terraform destroy
```

## Structure du projet

cloud-project/
├── main.tf
├── providers.tf
├── variables.tf
├── locals.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars
├── docker-compose.yml
├── modules/
│ ├── s3/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── dynamodb/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── screenshots/
