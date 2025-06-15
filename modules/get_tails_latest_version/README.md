# get_tails_latest_version

An OpenTofu/Terraform module get the latest Tails [https://tails.net/](https://tails.net/) by parsing the release RSS feed: [https://tails.net/doc/upgrade/release_notes/](https://tails.net/doc/upgrade/release_notes/)

## Requirements

The ```bash``` shell is required for this module.

## Module variabeles

### Input variabeles

none

### Output variables

* **tails_version**: The latest tails version

## Usage

```
module "get_tails_latest_version" {
  source = "./modules/get_tails_latest_version"
}
```
