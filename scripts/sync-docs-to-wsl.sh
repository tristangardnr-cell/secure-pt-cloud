#!/usr/bin/env bash
set -euo pipefail
source_dir='/mnt/c/Users/savib/Documents/Codex/secure-pt-cloud'
target_dir="$HOME/portfolio/secure-pt-cloud"
if [[ ! -d "$target_dir/.git" || ! -f "$source_dir/docs/phase6_documentation_summary.md" ]]; then
  printf '%s\n' 'Expected source documents or target Git repository missing; nothing copied.' >&2
  exit 1
fi
if [[ "$(realpath "$source_dir")" == "$(realpath "$target_dir")" ]]; then
  printf '%s\n' 'Source and target are the same; nothing copied.' >&2
  exit 1
fi
backup_dir="$HOME/portfolio/securept-documentation-backups/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"
for item in README.md docs diagrams screenshots scripts; do
  if [[ -e "$target_dir/$item" ]]; then cp -a "$target_dir/$item" "$backup_dir/"; fi
done
cp "$source_dir/README.md" "$target_dir/README.md"
for item in docs diagrams screenshots scripts; do
  mkdir -p "$target_dir/$item"
  cp -a "$source_dir/$item/." "$target_dir/$item/"
done

# Normalize Windows-mounted document permissions after copying.
chmod 0644 "$target_dir/README.md"
for item in docs diagrams screenshots; do
  find "$target_dir/$item" -type d -exec chmod 0755 {} +
  find "$target_dir/$item" -type f -exec chmod 0644 {} +
done
find "$target_dir/scripts" -type d -exec chmod 0755 {} +
find "$target_dir/scripts" -type f -exec chmod 0644 {} +
find "$target_dir/scripts" -type f -name "*.sh" -exec chmod 0755 {} +

printf 'Documentation copied. Prior files backed up at: %s\n' "$backup_dir"
printf '%s\n' 'Terraform files/state unchanged. No commit or push performed.'
git -C "$target_dir" status --short
