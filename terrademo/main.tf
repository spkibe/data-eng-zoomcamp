terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.16.0"
    }
  }
}

provider "google" {
  # credentials = "./keys/my_creds.json",
  project = "nyctaxidata-484908"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "nyctaxidata-484908-terr-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = "demo_dataset"
}