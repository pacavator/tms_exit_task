provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket      = "pacaterrabucket"
    prefix      = "terraform/state"
    credentials = "/home/pacavaca/terraform/pacaterraform.json"
  }
}

resource "google_compute_address" "static-ip" {
  name = "test-static-ip"
  address_type = "EXTERNAL"
  region = var.region
}


resource "google_compute_instance" "pacatest" {
  name         = "pacatestinst"
  machine_type = var.machine_type
  zone         = var.zone

  network_interface {
    network = "default"
    access_config {
        nat_ip = "${google_compute_address.static-ip.address}"
      }
    }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
      size = 30
    }
  }
metadata = {
    ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key}"
}
}

resource "google_compute_firewall" "allow_any_port" {
  name     = "allow-any-port"
  network  = "default"
  priority = "1003"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["${chomp(data.http.current_ip.response_body)}/32"]
}

resource "local_file" "current_static_ip" {
    content  = google_compute_instance.pacatest.network_interface[0].access_config[0].nat_ip
    filename = "static_ip.info"
    directory_permission = "0666"
    file_permission      = "0666"
}

output "ip_address" {
  value     = google_compute_instance.pacatest.network_interface[0].access_config[0].nat_ip
  sensitive = false
}

output "static_ip_address" {
  value     = google_compute_address.static-ip.address
  sensitive = false
}


data "google_compute_image" "image" {
  family  = var.image_family
  project = var.image_project
}

data "http" "current_ip" {
  url = "https://ipinfo.io/ip"
}

