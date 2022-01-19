# Cli Tools

## Import Terminal Profile

- open terminal
- Preferences
- Tab: Profiles
- bottom left settings: import..
- choose: `~/dotfiles/zsh/jellybeans.terminal`
- Tab: General
- *On startup, open: New window with profile:* **jellybeans**
- *New windows open with: same Profile / same Working Directory*

## Set Key Mapping

- System Preferences
- Keyboard
- Button: Modifier Keys
- Caps Lock: Escape

## SSH Keys

Generate new ssh key(s).

```zsh
ssh-keygen -t ed25519 -C "mail@domain.com"
```

Add the key(s):

```zsh
$ ssh-add ~/.ssh/id_rsa_name
```

Check your saved keys:

```zsh
$ ssh-add -l
```

## Git

Change the file `.gitconfig.user` in your home-folder and
provide your git credentials. If you need to support different
Github users depending on the directory, include another config file.

```zsh
[user]
  name = Your name
  email = youremail@domain.de
[includeIf "gitdir:~/Projects/xxx/"]
  path = .gitconfig.custom

[url "git@github.com:"]
  insteadOf = https://github.com/
[url "git@github-custom:other-user"]
  insteadOf = git@github.com:other-user
```

`.gitconfig.custom`

```zsh
[user]
  name = Your other name
  email = yourotheremail@domain.de
```

`~/.ssh/config`

```zsh
AddKeysToAgent  yes
IdentitiesOnly yes

Host github.com
  IdentityFile ~/.ssh/id_ed25519

Host github-custom
  HostName github.com
  IdentityFile ~/.ssh/custom_id_ed25519
```

