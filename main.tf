module "get_tails_latest_version" {
  source = "./modules/get_tails_latest_version"
}

locals {

  depends_on = [ module.get_tails_latest_version ]

  # tails_iso_path = "${abspath(path.root)}"
  tails_iso_path = "~/Downloads/isos/tails"
  tails_version = "${module.get_tails_latest_version.tails_version}"

}

module "download_tails_iso" {
  source        = "./modules/download_tails_iso"

  tails_version = "${local.tails_version}"
  iso_path      = "${local.tails_iso_path}"

}


output "tails_version" {
  value = "${module.get_tails_latest_version.tails_version}"
}
