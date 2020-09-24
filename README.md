# dev-env

Provisioning and deploying development environments, using `libvirt`, `packer`
and `vagrant`.

## Provisioning with `packer`

Debian `buster` VMs using `packer`.

### Requirements

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

Some variables are provided through `variables.json`. Make sure such a file 
exists and contains the necessary customised information.

E.g:
```json
{
  "username": "foo",
  "password": "bar"
}

```

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
