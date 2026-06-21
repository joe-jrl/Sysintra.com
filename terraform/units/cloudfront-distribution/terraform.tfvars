aws_region          = "eu-west-1"
domain_name         = "annabelsblog.co.uk"
aliases             = ["annabelsblog.co.uk", "www.annabelsblog.co.uk"]
bucket_name         = "annabelsblog.co.uk"
bucket_region       = "eu-west-1"
acm_certificate_arn = "arn:aws:acm:us-east-1:841708890209:certificate/7ca6c1b6-caab-46b4-8e18-9a8804917208"

default_root_object = "index.html"
enabled             = true
price_class         = "PriceClass_All"
http_version        = "http2"
ipv6_enabled        = true
cache_policy_id     = "658327ea-f89d-4fab-a63d-7e88639e58f6"

tags = {
  project     = "annabelsblog.co.uk"
  environment = "production"
}
