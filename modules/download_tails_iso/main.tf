locals {
  tails_version       = "${var.tails_version}"
  iso_file_name       =  "tails-amd64-${var.tails_version}.iso"
  sig_file_name       =  "tails-amd64-${var.tails_version}.iso.sig"
  iso_file_fullpath   = "${var.iso_path}/${local.iso_file_name}"
  sig_file_fullpath   = "${var.iso_path}/${local.sig_file_name}"
}

resource "null_resource" "tails_iso" {

    triggers = {

      tails_version       = "${local.tails_version}"
      iso_file_name       = "${local.iso_file_name}"
      sig_file_name       = "${local.sig_file_name}"
      iso_file_fullpath   = "${local.iso_file_fullpath}"
      sig_file_fullpath   = "${local.sig_file_fullpath}"

    }

}


#
# Using the abspath and pathexpand functions to support ~ with pathexpand
# abspath to get the complete (absolute path)
#

output "iso_file_fullpath" {

  value = "${abspath(pathexpand(local.iso_file_fullpath))}"

}

output "sig_file_fullpath" {

  value = "${abspath(pathexpand(local.sig_file_fullpath))}"

}

