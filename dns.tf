resource "aws_route53_zone" "primary" {
   name = "devopsisla.me"
}
resource "aws_route53_zone" "internal" {
   name = "internal.devopsisla.me"
   vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route53_record" "etcd1" {
   zone_id = "${aws_route53_zone.internal.zone_id}"
   name = "etcd1.internal.devopsisla.me"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.etcd1.private_ip}"]
}
resource "aws_route53_record" "etcd2" {
   zone_id = "${aws_route53_zone.internal.zone_id}"
   name = "etcd2.internal.devopsisla.me"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.etcd2.private_ip}"]
}
resource "aws_route53_record" "etcd3" {
   zone_id = "${aws_route53_zone.internal.zone_id}"
   name = "etcd3.internal.devopsisla.me"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.etcd3.private_ip}"]
}
resource "aws_route53_record" "jmp1" {
   zone_id = "${aws_route53_zone.primary.zone_id}"
   name = "jmp1.devopsisla.me"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.jmp1.public_ip}"]
}
resource "aws_route53_record" "discovery" {
   zone_id = "${aws_route53_zone.internal.id}"
   name = "discovery.internal.devopsisla.me"
   type = "SRV"
   ttl = "300"
   records = ["0 10 2379 ${aws_route53_record.etcd1.name}",
              "0 10 2379 ${aws_route53_record.etcd2.name}",
              "0 10 2379 ${aws_route53_record.etcd3.name}" ]
}
