resource "aws_instance" "etcd1" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "m4.large"
    availability_zone = "${lookup(var.AWS_AZ, var.AZ)}"
    subnet_id = "${aws_subnet.subnet_etcd2_discovery.id}"
    private_ip = "10.1.255.245"
    depends_on = ["aws_internet_gateway.internet_gateway"]
    key_name = "default"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    tags {
        Name = "etcd1"
    }
}
resource "aws_instance" "etcd2" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "m4.large"
    availability_zone = "${lookup(var.AWS_AZ, var.AZ)}"
    subnet_id = "${aws_subnet.subnet_etcd2_discovery.id}"
    private_ip = "10.1.255.246"
    depends_on = ["aws_internet_gateway.internet_gateway"]
    key_name = "default"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    tags {
        Name = "etcd2"
    }
}
resource "aws_instance" "etcd3" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "m4.large"
    availability_zone = "${lookup(var.AWS_AZ, var.AZ)}"
    subnet_id = "${aws_subnet.subnet_etcd2_discovery.id}"
    private_ip = "10.1.255.247"
    depends_on = ["aws_internet_gateway.internet_gateway"]
    key_name = "default"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    tags {
        Name = "etcd3"
    }
}
resource "aws_instance" "jmp1" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "m4.large"
    availability_zone = "${lookup(var.AWS_AZ, var.AZ)}"
    subnet_id = "${aws_subnet.subnet_dmz_boxes.id}"
    private_ip = "10.1.255.230"
    key_name = "default"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    tags {
        Name = "jmp1"
    }
}
