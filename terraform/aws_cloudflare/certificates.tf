# This verifies ownership through cloudflare. Other DNS providers are available and
# could be swapped in
resource "aws_acm_certificate" "lb" {
  domain_name       = "hub.${var.prefix}.wpscloud.co.uk"
  validation_method = "DNS"
}

data "cloudflare_zone" "zone" {
  name = var.dns_zone
}

resource "cloudflare_record" "lb_validate" {
  zone_id = data.cloudflare_zone.zone.id
  name = tolist(aws_acm_certificate.lb.domain_validation_options)[0].resource_record_name
  value = tolist(aws_acm_certificate.lb.domain_validation_options)[0].resource_record_value
  type = tolist(aws_acm_certificate.lb.domain_validation_options)[0].resource_record_type
}

resource "aws_acm_certificate_validation" "lb" {
  certificate_arn = "${aws_acm_certificate.lb.arn}"
}
