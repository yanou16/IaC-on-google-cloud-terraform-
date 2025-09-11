terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "e2-micro" # gratuit/free tier
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # tu peux changer en ubuntu si tu veux
    }
  }

  network_interface {
    network = "default"

    access_config {
      # attribue une IP publique
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }
}
