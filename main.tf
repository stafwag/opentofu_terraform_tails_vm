module "get_tails_latest_version" {
  source = "./modules/get_tails_latest_version"
}

output "tails_version" {
  value = "${module.get_tails_latest_version.tails_version}"
}
