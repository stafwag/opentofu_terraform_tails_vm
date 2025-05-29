# opentofu_terraform_tails_vm

[OpenTofu](https://opentofu.org/)/[Terraform](https://developer.hashicorp.com/terraform)
code to spin up a [Tails](https://tails.net/) libvirt/KVM virtual machine on GNU/Linux. 

There're security considerations when you run tails in a virtual machine see:

[https://tails.net/doc/advanced_topics/virtualization/index.en.html](https://tails.net/doc/advanced_topics/virtualization/index.en.html) for more information.

The code in this repository:

* Will check for the latest tails release by reading the RSS feed on
[https://tails.net/doc/upgrade/release_notes/](https://tails.net/doc/upgrade/release_notes/)
* Download the latest CDROM image
* Start a libvirt/KVM virtual machine on GNU/Linux

## Usage

## Install OpenTofu or terraform

See: [https://opentofu.org/docs/intro/install/](https://opentofu.org/docs/intro/install/)

## Import the tails public GnuPG key

Download the tails public GnuPG from: [https://tails.net/tails-signing.key](https://tails.net/tails-signing.key)

```bash
$ wget https://tails.net/tails-signing.key
```

Import the public key.

```
$ gpg --import tails-signing.key
gpg: key DBB802B258ACD84F: 2172 signatures not checked due to missing keys
gpg: key DBB802B258ACD84F: "Tails developers (offline long-term identity key) <tails@boum.org>" not changed
gpg: Total number processed: 1
gpg:              unchanged: 1
```

## Start the virtual machine

### init

```
$ tofu init
```

### plan

```
$ tofu plan
```

### apply

```
$ tofu apply
```

***Have fun!***
