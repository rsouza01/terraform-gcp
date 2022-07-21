variable "image" { default = "ubuntu-os-cloud/ubuntu-2004-lts" }

variable "machine_type" { default = "n1-standard-1" }

variable "environment" { default = "production" }

variable "machine_type_dev" { default = "n1-standard-4" }

variable "zone" { default = "europe-west4-a" }

variable "name_count" {
  default = ["server1", "server2", "server3"]
}

variable "machine_type_map" {
  type = map(string)
  default = {
    "dev"  = "n1-standard-1"
    "prod" = "production_box_wont_work"
  }
}
