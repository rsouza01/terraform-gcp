resource "google_storage_bucket" "bucket" {
  count         = 1
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.bucket_storage

  labels = {
    name     = var.bucket_name
    location = var.bucket_location
  }
  versioning {
    enabled = true
  }
}
