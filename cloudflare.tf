terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "hm-terraform-state"
    region = "eu-west-1"
    key    = "dns.tfstate"
  }
}

provider "cloudflare" {
}

variable "zone_id" {
  default = "694a0e1d06e80b0e7d5e2f316b5296b1"
}

variable "domain" {
  default = "harrymartland.co.uk"
}

resource "cloudflare_record" "home" {
  zone_id = var.zone_id
  name    = "home"
  value   = "2a01:4b00:d002:b601:8ee8:1241:9013:c2da"
  type    = "AAAA"
  proxied = true
}