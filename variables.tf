variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region GCP"
  default     = "us-central1"
}

variable "zone" {
  description = "Zone GCP"
  default     = "us-central1-a"
}

variable "ssh_user" {
  description = "Nom d'utilisateur SSH"
  default     = "rayane"
}

variable "ssh_pub_key" {
  description = "Chemin vers ta clé publique SSH"
  default     = "~/.ssh/id_rsa.pub"
}
