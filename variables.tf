variable "buckets" {
  default = [
    {
      name = "seongland"
    },
    {
      name = "pointland"
    },
    {
      name = "liveland"
    },
    {
      name = "potreeland"
    }
  ]
}


variable "cloud_runs" {
  default = [
    {
      name = "accountland"
    }
  ]
}

variable "custom_headers" {
  default = {
    "X-Frame-Options"        = "DENY",
    "X-XSS-Protection"       = 1,
    "X-Content-Type-Options" = "nosniff"
  }
}


variable "lbs" {
  default = [
    {
      name = "seongland-https-lb"
      backend_buckets = [
        {
          bucket  = "seongland",
          headers = var.custom_headers,
          cdn = true
        },
        {
          bucket  = "pointland",
          headers = var.custom_headers,
          cdn = true
        },
        {
          bucket  = "liveland",
          headers = var.custom_headers,
          cdn = true
        },
        {
          bucket = "potreeland",
          cdn = true
        }
      ]
      backend_services = [
        {
          type = "cloudrun",
          headers = var.custom_headers
        }
      ]
      enpoint_groups = [

      ],
      path_rules = [

      ]
    },
    {
      name = "seongland-http-lb"
    }
  ]
}
