variable project {}

provider "google" {
  project = "${var.project}"
  region = "us-east1"
}

resource "google_compute_instance" "common" {
    name         = "test-instance"
    machine_type = "n1-standard-1"
    zone = "us-east1-b"

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-9"
      }
    }

    network_interface {
      network = "default"
      access_config {}
    }
}
