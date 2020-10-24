resource "google_storage_bucket" "this" {
  name                        = var.config.site.domain
  force_destroy               = true
  uniform_bucket_level_access = true
}

# NOTE: This requires adding "Owner" and "Project Owner" to gcloud auth'd user
resource "google_storage_bucket_iam_binding" "admin" {
  bucket  = google_storage_bucket.this.name
  role    = "roles/storage.admin"
  members = var.config.users.admin
}

resource "google_storage_bucket_iam_binding" "allUsers" {
  bucket = google_storage_bucket.this.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}
