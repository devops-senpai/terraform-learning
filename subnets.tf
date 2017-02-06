resource "aws_subnet" "subnet_etcd2_discovery" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${lookup(var.vpc_base_cidr, var.ENVIRONMENT)}.255.240/28"
    availability_zone = "${lookup(var.AWS_AZ, var.AZ)}"
    tags {
        Name = "etcd2 discovery"
    }
}
resource "aws_subnet" "subnet_dmz_boxes" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${lookup(var.vpc_base_cidr, var.ENVIRONMENT)}.255.225/28"
    availability_zone = "${lookup(var.AWS_AZ, var.AZ)}"
    map_public_ip_on_launch = "true"
    tags {
        Name = "dmz boxes"
    }
}
