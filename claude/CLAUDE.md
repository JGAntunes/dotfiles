# Environment
- Shell: fish (default shell). Write fish syntax for shell config and dotfiles; follow the project's conventions elsewhere.
- Editor: neovim (heavy vim user). Assume vim keybindings and modal editing context.
- OS: macOS (primary), Linux (secondary).
- Package manager: Homebrew.

# Stack
- Languages: Go (primary), TypeScript/JavaScript, bash/sh scripts
- Infra: kubectl (aliased as `k`), AWS (awsctx/awsreg for context/region switching)
- Git: rebase strategy, GPG signing, conventional commits

# SSH & Git identity
Two yubikey-backed SSH keys, selected by directory via gitconfig includes:
- `~/workspace/github/` → personal key, remote host `github.com`
- `~/workspace/work/` → work key (ClickHouse), remote host `github.com-work`

When working in `~/workspace/work/`, always use `github.com-work` as the SSH host alias — e.g. `git@github.com-work:org/repo.git`, not `git@github.com:`. This applies to remote URLs, `go get`, and any git operations involving GitHub.

# Coding conventions
- Match the style of the file being edited — don't impose uniformity across the codebase.
- No backwards-compat shims, no speculative abstractions, no over-engineering.
