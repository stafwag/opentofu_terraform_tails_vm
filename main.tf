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

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_domain" "mytails" {

    depends_on = [ module.download_tails_iso ]

    name = "${var.name}"
    memory = "${var.memory}"
    vcpu = "${var.cpus}"

    cpu {
      mode = "host-passthrough"
    }

    video {
      type = "qxl"
    }

    disk {
      file = "${module.download_tails_iso.iso_file_fullpath}"
    }

    network_interface {
      network_name = "default"
    }

    #
    # Add spice channel
    # based on https://github.com/dmacvicar/terraform-provider-libvirt/blob/main/examples/v0.13/xslt/add_spicevmc.xsl
    #

    xml {
      xslt = file("add_spicevmc.xsl")
    }

}

output "tails_version" {
  value = "${module.get_tails_latest_version.tails_version}"
}
