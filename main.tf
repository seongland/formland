provider "google" {
  project = "seong-land"
  region  = "asia-northeast3"
  zone    = "asia-northeast3-b"
}


resource "google_storage_bucket" "static-site" {
  name     = "www.seongland.com"
  location = "asia-northeast3"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = "www.seongland.com"
  role   = "READER"
  entity = "allUsers"
}