# borg

## create user

```sh
useradd -m user
mkdir /home/user/.ssh
echo "command="borg serve",restrict ssh-ed25519 k8j9k8....dasdfsa" > /home/user/.ssh/authorized_keys
chown -R user:user /home/user/.ssh
chmod 700 /home/user/.ssh
```

## initialize repository

```sh
su - user
borg init --encryption=repokey backup/repo-name
```

## create archive from remote

```sh
cd /path/to/backup
borg create --stats --compression lz4 user@borg-host:./repo-name::archive-name .
```

## get passphrase from ssh key

```sh
sed -n '3p' ~/.ssh/id_ed25519 | head -c 32
```

```bash
export BORG_PASSCOMMAND="sed -n '3p' ~/.ssh/id_ed25519 | head -c 32"
```
