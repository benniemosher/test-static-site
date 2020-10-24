resource "google_storage_bucket" "this" {
  name                        = var.config.site.domain
  force_destroy               = true
  uniform_bucket_level_access = true
}
