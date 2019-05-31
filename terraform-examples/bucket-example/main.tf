variable project { }

provider "google" {
  project = "${var.project}"
}

resource "google_storage_bucket" "image-store" {
  name     = "my-project-image-store-bucket"
  location = "US"
  project = "${var.project}"
}
