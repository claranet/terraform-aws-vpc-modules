resource "aws_eip" "natgw" {
  count = "${var.subnet_count}"

  vpc = true
}

resource "aws_nat_gateway" "natgw" {
  count = "${var.subnet_count}"

  allocation_id = "${element(aws_eip.natgw.*.id, count.index)}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"
  tags          = "${var.tags}"
}
