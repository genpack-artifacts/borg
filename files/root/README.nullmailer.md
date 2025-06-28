# nullmailer

## to enable nullmailer

```sh
echo 'smtp.example.com smtp' >> /etc/nullmailer/remotes
hostname > /etc/nullmailer/me
echo 'example.com' > /etc/nullmailer/defaultdomain
systemctl start nullmailer
```

## to enable nullmailer-smtpd

```
systemctl enable nullmailer-smtpd.socket --now
```
