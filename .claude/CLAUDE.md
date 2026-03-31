# Dotfiles (ZORDinator)

Personal dotfiles repo. Manages shell, editor, terminal, SSH/GPG, and AI tooling config via symlinks.

## Bootstrap

```bash
git clone https://github.com/JGAntunes/dotfiles.git ~/github/dotfiles --recurse-submodules
bash init.sh        # sets fish as default shell, runs init.fish
# init.fish sources config, then runs: zordinator --symlink --fisherman
```

## Repo structure

| Directory | Symlink target | Purpose |
|-----------|---------------|---------|
| `fish/` | `~/.config/fish` | Fish shell (config.fish, functions, aliases, completions) |
| `nvim/` | `~/.config/nvim` | Neovim (Lua, lazy.nvim) |
| `kitty/` | `~/.config/kitty` | Kitty terminal |
| `starship/` | `~/.config/starship` | Prompt themes (dark/light) |
| `claude/` | `~/.claude` | Claude Code config — edits here are live immediately |
| `tilde/` | `~/` | Files dropped into home dir (`.Brewfile`, `.ideavimrc`, etc.) |
| `ssh/` | `~/.ssh` | SSH config (two Yubikey-backed identities) |
| `gnupg/` | `~/.gnupg` | GPG config |
| `hooks/` | git hooks dir | `post-merge` auto-runs brew/apt after pull |
| `sway/` | `~/.config/sway` | Sway WM (Linux only) |

## Symlink management

All symlinks are managed by `zordinator` (`fish/functions/zordinator.fish`). Don't create symlinks manually.

```fish
zordinator --symlink           # create/preserve existing
zordinator --symlink --force   # overwrite existing
```

## Language conventions per config type

- `fish/` — fish syntax only, no bash/zsh constructs
- `nvim/` — Lua; 2-space indent, 120-char column (see `.stylua.toml`)
- `init.sh`, `macos.sh`, `linux.sh` — POSIX sh / bash

## Adding packages (macOS)

Edit `tilde/.Brewfile`, or just `brew install <pkg>` — the `post_exec` hook in `fish/config.fish` auto-dumps `.Brewfile` and commits after any `brew install`/`brew remove`.

## Gotchas

- `claude/` is a live symlink to `~/.claude`. Editing `claude/CLAUDE.md` or `claude/settings.json` takes effect immediately in any running Claude session.
- `tilde/` files are symlinked with their `.`-prefixed names stripped — e.g. `tilde/.Brewfile` → `~/.Brewfile`.
- The `post-merge` hook (`hooks/post-merge`) runs `brew bundle --global` automatically after `git pull` if `.Brewfile` changed. Don't be surprised by brew running on pull.

## Commit style

Conventional commits (`chore:`, `feat:`, `fix:`), GPG-signed. Emoji in messages is fine (consistent with history).
