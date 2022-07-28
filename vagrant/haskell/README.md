# Generic Development Environment

## Vagrant Usage

Start / Provision:

```bash
vagrant up
```

Access:

```bash
vagrant ssh
```

Halt:

```bash
vagrant halt
```

Destroy:

```bash
vagrant destroy
```

Keep syncing automatically at each file change:

```bash
vagrant rsync-auto
```

## Haskell install

```bash
cd /vagrant/scripts
bash haskell.sh
```

```vim
LspInstall hls
TSInstall haskell
```
