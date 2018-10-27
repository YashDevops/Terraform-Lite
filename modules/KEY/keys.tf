resource "aws_key_pair" "ec2_keys" {
  key_name   = "${var.key_name}"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
