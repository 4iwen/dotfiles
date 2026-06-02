#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_HOME="${HOME}"

manifest_entries() {
  cat <<'EOF'
zsh|.zshrc|file
oh-my-zsh|.oh-my-zsh/custom/themes|dir
git|.gitconfig|file
git|.config/git|dir
micro|.config/micro|dir
fastfetch|.config/fastfetch|dir
ghostty|Library/Application Support/com.mitchellh.ghostty/config.ghostty|file
EOF
}

backup_excludes() {
  cat <<'EOF'
.DS_Store
*.log
*.tmp
*.bak
*.swp
*.swo
*~
backups/
buffers/
.claude/settings.local.json
github-copilot/
conf.d/*env*.fish
.git/
EOF
}

package_names() {
  manifest_entries | awk -F'|' '{print $1}' | uniq
}

package_exists() {
  local wanted=$1
  package_names | grep -Fxq "$wanted"
}

package_has_files() {
  local pkg=$1
  [[ -d "${REPO_ROOT}/${pkg}" ]] || return 1
  find "${REPO_ROOT}/${pkg}" -type f -o -type l | grep -q .
}

available_packages() {
  while IFS= read -r pkg; do
    package_has_files "${pkg}" && echo "${pkg}"
  done < <(package_names)
}
