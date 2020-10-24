provider "google" {
  project = var.config.google.project
  region  = var.config.google.region
  zone    = var.config.google.zone
}
