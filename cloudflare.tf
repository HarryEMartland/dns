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
  value   = "2a01:4b00:d002:b601:8339:6522:7a06:6657"
  type    = "AAAA"
  ttl     = "1"
  proxied = true
}

resource "cloudflare_record" "router" {
  zone_id = var.zone_id
  name    = "router"
  value   = "192.168.1.1"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "harrymartland-co-uk" {
  zone_id = var.zone_id
  name    = "harrymartland.co.uk"
  value   = "185.199.111.153"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "www-harrymartland-co-uk" {
  zone_id = var.zone_id
  name    = "www.harrymartland.co.uk"
  value   = "harryemartland.github.io"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "fa" {
  zone_id = var.zone_id
  name    = "fa"
  value   = "harryemartland.github.io"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "united-games" {
  zone_id = var.zone_id
  name    = "united-games"
  value   = "harryemartland.github.io"
  type    = "CNAME"
  proxied = false
}
