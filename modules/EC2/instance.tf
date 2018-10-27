resource "aws_instance" "main" {
  count         = "${var.count}"
  ami           = "${var.ami}"
  instance_type = "${var.ins_type}"
  subnet_id     = "${var.subnet_id}"

  tags {
    Name = "Demo"
  }
}
