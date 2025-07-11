## Prep

```sh
setup-alpine
# setup-keymap us / us-dvorak
# hostname mars
# ntp-client busybox
# disk vda mode sys
# user m
reboot

vi /etc/apk/repositories # enable community, https
apk add doas git
echo "permit nopass :m" >>/etc/doas.d/doas.conf
setup-desktop # xfce
```

## Post install checklist

Ensure signing keys.

```sh
ls ~/.ssh/id_ed*
```
