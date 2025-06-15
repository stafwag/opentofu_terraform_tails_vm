# download_tails_iso

An OpenTofu/Terraform module to download Tails [https://tails.net](https://tails.net) iso disk image.
The module will download the disk image signature and verify the signature.

## Requirements

* [GnuPG](https://www.gnupg.org/) ```gpg``` is required
* The Tails ```gpg`` signing key [https://tails.net/tails-signing.key](https://tails.net/tails-signing.key) needs to be imported.

## Module variabeles

### Input variabeles

* **tails_version**: The tails version to download, by note that only the latest tails version is available on the Tails download site.
When you try to download another (older) tails version the module will fail.
* **iso_path**: The iso image destination path.

### Output variabeles

* **iso_file_fullpath**: The path to the download iso image.

## Usage

### Download tails

```
module "download_tails_iso" {
  source = "./modules/download_tails_iso"

  tails_version = var.tails_version
  iso_path      = var.tails_iso_path

}
```
