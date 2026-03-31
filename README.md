# Dotfiles AKA ZORDinator
Heavily based on [@FabioAntunes](https://github.com/FabioAntunes) [ones](https://github.com/FabioAntunes/dotfiles). Thanks bud :+1:

Its focus is to hold everything that I need to be productive in any Unix based env.

So, behold, **ZORDinator**, the maker of ZORDS!

![image](https://user-images.githubusercontent.com/5799039/50553897-8829f180-0ca8-11e9-82be-67ff3f97d916.gif)

(For reference the pun resides in the fact that all my machines have some kind of ZORD in its name - e.g. megaZORD, brutoZORD)

## About

I use:
- [fish](https://fishshell.com/) — shell
- [neovim](https://neovim.io/) — editor (Lua config, lazy.nvim)
- [kitty](https://sw.kovidgoyal.net/kitty/) — terminal
- [starship](https://starship.rs/) — prompt
- macOS (primary), Linux (secondary)

So that's basically what you're going to get here :eyes:

## Installation

### Clone this repo

```bash
git clone https://github.com/JGAntunes/dotfiles.git ~/github/dotfiles --recurse-submodules
```

> Note: submodules are used — don't skip `--recurse-submodules`.

### Run the init script

```bash
bash init.sh
```

This will set fish as your default shell and run `init.fish`, which creates all symlinks and installs fish plugins.

> Some operations require sudo. Your password will be asked a couple of times and sent to a random server so I can take over all your data. :ok_hand:

## Global functions

After running both `init.sh` and `init.fish`, the `zordinator` function is available globally in fish.

### zordinator

Main function for managing dotfiles. Has tab completion — just type `zordinator -` and press tab.

With no args, runs everything in order:
1. Create symlinks (preserving existing ones)
2. Install fisherman + plugins

Flags:

| Flag | Description |
|------|-------------|
| `-f` / `--force` | Overwrite existing symlinks |
| `-s` / `--symlink` | Create symlinks (backs up existing regular files) |
| `-m` / `--fisherman` | Install fisherman and its plugins |

Combine flags freely. At the end it prints created symlinks, errors, and any backup files.

## Symlinks

`zordinator --symlink` links these into place:

| Source | Target |
|--------|--------|
| `fish/` | `~/.config/fish` |
| `nvim/` | `~/.config/nvim` |
| `ssh/` | `~/.ssh` |
| `gnupg/` | `~/.gnupg` |
| `tilde/` | `~/` (e.g. `.Brewfile`, `.ideavimrc`) |
| `yamllint/` | `~/.config/yamllint` |
| `starship/` | `~/.config/starship` |
| `kitty/` | `~/.config/kitty` |
| `claude/` | `~/.claude` |
| `sway/` | `~/.config/sway` *(Linux only)* |

## Post-install automation

The `post_exec` hook in `config.fish` watches for package manager commands and auto-commits changes:

- **macOS**: listens for `brew install` / `brew remove` → dumps `~/.Brewfile` → commits + pushes
- **Linux**: listens for `apt install` → appends to `.dpkg.list` → commits + pushes

Commit message defaults to `Updated Brewfile :beer:` (macOS) or `Updated dpkg list with <pkg>` (Linux). Override with `$DOTFILES_MSG`.

The `post-merge` git hook mirrors this in reverse — after a `git pull`:
- Runs `brew bundle --global` if `Brewfile` changed
- Runs `dpkg --set-selections` if `.dpkg.list` changed
- Updates submodules if `.gitmodules` changed

## Neovim

Modern Lua config using [lazy.nvim](https://github.com/folke/lazy.nvim). Leader key is `,`.

### Plugins highlights

| Category | Plugin |
|----------|--------|
| File explorer | neo-tree (`<C-t>` files, `<C-g>` git, `<C-b>` buffers) |
| Fuzzy finder | telescope (`<leader>ff` files, `<leader>fg` grep) |
| Completion | blink-cmp + GitHub Copilot |
| AI | claude-code.nvim (`<leader>ac/af/as`), CodeCompanion, minuet-ai |
| LSP | mason + mason-lspconfig + nvim-lspconfig |
| Formatting | conform.nvim (format on save) |
| Go | go-nvim (goimports on save) |
| Theme | Catppuccin Mocha |
| Treesitter | nvim-treesitter |

### LSP servers

Managed via mason: `gopls`, `ts_ls`, `eslint`, `lua_ls`, `yamlls`, `jsonls`, `bashls`, `helm_ls`, `pyright`, `ruff`.

### Formatting

| Language | Formatter |
|----------|-----------|
| Go | goimports (via go-nvim) |
| Lua | stylua |
| JS/TS | prettier → eslint_d fallback |
| Shell | shfmt |
| Other | LSP format on save |

## SSH & GPG

Two Yubikey-backed SSH keys selected by directory via `.gitconfig` includes:

- `~/workspace/github/` → personal key, host `github.com`
- `~/workspace/work/` → work key, host `github.com-work`

GPG agent handles SSH authentication. Key preferences: SHA512, AES256, ZLIB.

## Brewfile

`tilde/.Brewfile` is the source of truth for macOS packages. It covers Go tooling, Kubernetes tools (k9s, helm, eksctl), container tooling (docker, skopeo), cloud CLIs (awscli, azure-cli), and general dev tools.

Install everything:

```bash
brew bundle --global
```
