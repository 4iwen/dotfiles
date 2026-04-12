# Dotfiles

This repository keeps a git-managed backup of selected dotfiles in a Stow-style layout.

## Backed Up

- `~/.zshrc`
- `~/.oh-my-zsh/custom/example.zsh`
- `~/.oh-my-zsh/custom/themes/`
- `~/.gitconfig`
- `~/.config/git/`
- `~/.config/micro/`
- `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`

## Commands

```sh
bash ./bin/backup
bash ./bin/status
bash ./bin/restore
bash ./bin/restore --apply
bash ./bin/restore --package zsh
bash ./bin/restore --package zsh --apply
```
