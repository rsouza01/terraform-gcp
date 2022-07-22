variable "path" { default = "/workspaces/terraform-gcp/terraform/credentials" }

provider "google" {
  project     = "terraform-gcp-poc-356911"
  region      = "europe-west2-a"
  credentials = file("${var.path}/secrets.json")
}

provider "google-beta" {
  project     = "terraform-gcp-poc-356911"
  region      = "europe-west2-a"
  credentials = file("${var.path}/secrets.json")
}
