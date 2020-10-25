provider "google-beta" {
  project = var.config.google.project
  region  = var.config.google.region
  zone    = var.config.google.zone
}

module "static-assets_http-load-balancer-website" {
  source  = "gruntwork-io/static-assets/google//modules/http-load-balancer-website"
  version = "0.2.0"

  enable_ssl          = true
  project             = var.config.google.project
  ssl_certificate     = join("", google_compute_managed_ssl_certificate.default.*.self_link)
  website_domain_name = var.config.site.domain
}

resource "google_compute_managed_ssl_certificate" "default" {
  provider = google-beta
  name     = local.dashed_domain

  managed {
    domains = [var.config.site.domain]
  }
}
