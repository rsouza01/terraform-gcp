resource "google_compute_network" "network" {
  name                    = "rsouza-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "rsouza-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "europe-west4"
  network       = google_compute_network.network.self_link
}

