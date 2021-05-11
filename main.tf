provider "google" {
  project = "seong-land"
  region  = "asia-northeast3"
  zone    = "asia-northeast3-b"
}


resource "google_storage_bucket" "bucket-map" {
  count    = length(var.buckets)
  name     = var.buckets[count.index].name
  location = "asia-northeast3"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}


resource "google_storage_bucket_access_control" "bucket-rule-map" {
  count  = length(var.buckets)
  bucket = var.buckets[count.index].name
  role   = "READER"
  entity = "allUsers"
}
