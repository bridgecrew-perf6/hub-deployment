# This generates records in cloudflare. Other DNS providers could be substituted.

resource "cloudflare_record" "lb" {
  zone_id = data.cloudflare_zone.zone.id
  name = "${aws_acm_certificate.lb.domain_name}"
  value = "${aws_lb.hublb.dns_name}"
  type = "CNAME"
}

resource "cloudflare_record" "hub" {
  zone_id = data.cloudflare_zone.zone.id
  name = "hubvm.${var.prefix}.${var.dns_zone}"
  value = "${aws_instance.hub.private_ip}"
  type = "A"
}

resource "cloudflare_record" "worker" {
  count = var.worker_vm_count
  zone_id = data.cloudflare_zone.zone.id
  name = "worker${count.index}.${var.prefix}.${var.dns_zone}"
  value = "${aws_instance.worker[count.index].private_ip}"
  type = "A"
}
