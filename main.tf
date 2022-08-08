#Test#

resource "google_compute_instance" "vminstance" {
  name         = "vminstance"
  machine_type = "n1-standard-1"
  zone         = "us-west1-b"

  tags = ["db"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    sshKeys = "ubuntu:${file(var.ssh_public_key_filepath)}"
  }

}
