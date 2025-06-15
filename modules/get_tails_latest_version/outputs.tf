output "tails_version" {

  value = data.external.get_tails_latest_version.result.version

}
