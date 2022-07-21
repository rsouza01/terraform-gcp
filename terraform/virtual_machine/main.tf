resource "google_compute_instance" "default" {
  count = 1
  # count = length(var.name_count)
  name = "list-${count.index + 1}"

  machine_type   = var.environment == "production" ? var.machine_type : var.machine_type_dev
  can_ip_forward = false
  description    = "This is a virtual machine"
  zone           = var.zone
  tags           = ["allow-http"] # FIREWALL

  boot_disk {
    initialize_params {
      image = var.image
      size  = "20"
    }
  }

  labels = {
    name         = "list-${count.index + 1}"
    machine_type = var.environment == "production" ? var.machine_type : var.machine_type_dev
  }

  metadata = {
    size = "20"
    foo  = "bar"
  }

  metadata_startup_script = "echo hi > text.txt"

  network_interface {
    network = "default"
  }

  service_account {
    scopes = [
      "userinfo-email", "compute-ro", "storage-ro"
    ]
  }
}

resource "google_compute_disk" "default" {
  name = "test-disk"
  type = "pd-ssd"
  zone = var.zone
  size = 10
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.self_link
  instance = google_compute_instance.default[0].self_link
}

output "machine_type" {
  value = google_compute_instance.default.*.machine_type
}

output "name" {
  value = google_compute_instance.default.*.name
}

output "zone" {
  value = google_compute_instance.default.*.zone
}

output "instance_id" {
  value = join(",", google_compute_instance.default.*.id)
}
