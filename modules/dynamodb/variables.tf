variable "table_name" {
  type        = string
  description = "Nom de la table DynamoDB"
}

variable "billing_mode" {
  type        = string
  description = "Mode de facturation DynamoDB"
  default     = "PAY_PER_REQUEST"
}

variable "tags" {
  type        = map(string)
  description = "Tags a appliquer sur la table"
  default     = {}
}
