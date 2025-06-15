#
# Using the abspath and pathexpand functions to support ~ with pathexpand
# abspath to get the complete (absolute path)
#

output "iso_file_fullpath" {

  value = abspath(pathexpand(local.iso_file_fullpath))

}

output "sig_file_fullpath" {

  value = abspath(pathexpand(local.sig_file_fullpath))

}
