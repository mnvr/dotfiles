Last used with Alpine Linux.

```sh
git clone https://github.com/mnvr/dotfiles
cd dotfiles/linux
sh setup.sh
sh config.sh
```

Out of band setup.

```sh
doas apk add openssh-keygen && ls ~/.ssh/id_ed* # ensure keys
```

Documentation accompanying this configuration:

* [mnvr.in/mars](https//mnvr.in/mars/)
