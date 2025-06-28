# borg

## create user

```sh
useradd -m user
su - user
ssh-keygen -t ed25519
echo 'command="borg serve",restrict ssh-ed25519 k8j9k8....dasdfsa' > .ssh/authorized_keys
mkdir backup
```

## initialize repository

```sh
su - user
borg init --encryption=repokey backup/repo-name
```

## create archive from remote

```sh
cd /path/to/backup
borg create --stats --compression lz4 user@borg-host:./backup/repo-name::archive-name .
```

## get passphrase from ssh key

```sh
sed -n '6p' ~/.ssh/id_ed25519 | head -c 32
```

```bash
export BORG_PASSCOMMAND='sh -c "sed -n 6p $HOME/.ssh/id_ed25519 | head -c 32"'
```

## mount repository

```sh
borg mount /home/user/backup/repo-name /mnt
```

