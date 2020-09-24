# dev-env

Provisioning and deploying development environments, using `libvirt`, `packer`
and `vagrant`.

## Provisioning with `packer`

Debian `buster` VMs using `packer`.

### Requirements

#### Preseed file

The template preseed file `preseed.cfg` is here as an example, the current
packer setup will look for `preseed_production.cfg` that you should use and
customise to suit your needs.

Examples of customised information:
  - country code
  - root password
  - username
  - user password
  - timezone
  - sudoer

#### JSON variables

Some variables are provided through `variables.json`. Make sure such a file 
exists and contains the necessary customised information.

E.g:
```json
{
    "iso_version": "10.5.0",
    "iso_checksum": "0a6aee1d9aafc1ed095105c052f9fdd65ed00ea9274188c9cd0072c8e6838ab40e246d45a1e6956d74ef1b04a1fc042151762f25412e9ff0cbf49418eef7992e",
    "username": "foo",
    "password": "bar"
}
```

#### SSH authorized keys

Add a file named `authorized_keys_production` in `files`, containing the public
keys of `ssh` clients you want to be able to connect to your VM.

### Usage

Use makefile, e.g.:

```bash
make devenv
```

This will create all intermediary images with a `devenv.box` ready to be used
by `vagrant`.

## Deploying with `vagrant`

Vagrant based on `.box` image created with `packer`.

### Requirements

Some variables are provided through `config.yaml`. Make sure such a file exists
and contains the necessary variables.

E.g:
```yaml
---
conf:
    vmuser: 'frodo'
    localuser: 'gimli'
    priv_key: 'id_rsa'

packages:
    - git
    - moreutils
    - htop
    - iotop
    - tmux
    - ncdu
    - aptitude
```

The `Vagrantfile` is also expecting scripts and data files that are not version
controlled, either remove / comment out those calls or create the scripts and
files.

### Usage

Add a box, that we shall name `mybox`:

```bash
vagrant box add --name mybox /path/to/vagrant.box
```

Then spin up the environment by running the following command from a folder
containing a `Vagrantfile`

```bash
vagrant up
```
