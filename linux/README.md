Last used with Alpine Linux.

```sh
git clone me
cd dotfiles/linux
sh setup.sh
doas apk add openssh-keygen && ls ~/.ssh/id_ed* # ensure keys
cd ~/.config && git init && git add . && git commit -m 'Initial commit'
sh config.sh
```
