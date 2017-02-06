resource "aws_vpc" "main" {
    cidr_block = "${lookup(var.vpc_base_cidr, var.ENVIRONMENT)}.0.0/16"
    tags {
        Name = "main"
    }
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "main"
    }
}

#resource "aws_main_route_table_association" "route_main" {
#    vpc_id = "${aws_vpc.main.id}"
#    route_table_id = "${aws_route_table.route_dmz.id}"
#}
#
#resource "aws_route_table" "route_dmz" {
#    vpc_id = "${aws_vpc.main.id}"
#    route {
#        cidr_block = "0.0.0.0/0"
#        instance_id = "${aws_instance.jmp1.id}"
#    }
#    tags {
#        Name = "main"
#    }
#}