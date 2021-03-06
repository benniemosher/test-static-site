locals {
  dashed_domain = replace(var.config.site.domain, ".", "-")
}

variable "config" {
  default = {
    google = {
      project = "test-static-site-293512"
      region  = "us-central1"
      zone    = "us-central1-c"
    }
    site = {
      domain = "test.benniemosher.dev"
      org = "Bennie Mosher"
    }
    users = {
      admin = [
        "user:benniemosher@gmail.com"
      ]
    }
  }
}
