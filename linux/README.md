Last used with Alpine Linux.

```sh
git clone https://github.com/mnvr/dotfiles
cd dotfiles/linux
sh setup.sh
sh config.sh
```

Documentation accompanying this configuration:
[mnvr.in/mars](https//mnvr.in/mars/)

### Manual setup

Ensure signing keys.

```sh
doas apk add openssh-keygen && ls ~/.ssh/id_ed*
```

Font.

```sh
wget FiraCode-latest.zip
unzip FiraCode*.zip
mkdir ~/.local/share/fonts/FiraCode
mv ttf ~/.local/share/fonts/FiraCode
```
