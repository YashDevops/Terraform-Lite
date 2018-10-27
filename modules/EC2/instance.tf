resource "aws_instance" "main" {
  count         = "${var.count}"
  ami           = "${var.ami}"
  instance_type = "${var.ins_type}"
  subnet_id     = "${var.subnet_id}"
  key_name      = "${var.key_name}"

  tags {
    Name = "Demo"
  }
}
