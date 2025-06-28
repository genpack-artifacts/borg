#!/bin/sh
set -e

# fifos cannot be copied up with overlayfs, so we create them here
if [[ ! -e /var/spool/nullmailer/trigger ]]; then
	mkfifo --mode=0660 "/var/spool/nullmailer/trigger"
fi
chown nullmail:nullmail /var/spool/nullmailer/{tmp,queue,failed,trigger}
chmod 770 /var/spool/nullmailer/{tmp,queue,failed}
chmod 660 /var/spool/nullmailer/trigger
