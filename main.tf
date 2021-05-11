provider "google" {
  project = "seong-land"
  region  = "asia-northeast3"
  zone    = "asia-northeast3-b"
}


resource "google_storage_bucket" "seongland-bucket" {
  name     = "seongland"
  location = "asia-northeast3"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_access_control" "seongland-bucket-rule" {
  bucket = "seongland"
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket" "pointland-bucket" {
  name     = "pointland"
  location = "asia-northeast3"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_access_control" "pointland-bucket-rule" {
  bucket = "pointland"
  role   = "READER"
  entity = "allUsers"
}
