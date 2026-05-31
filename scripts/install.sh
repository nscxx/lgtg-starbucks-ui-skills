#!/usr/bin/env bash
# 将 Skill 安装到 Cursor 个人目录（macOS / Linux）
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_SRC="$REPO_ROOT/skills"
CURSOR_SKILLS="${HOME}/.cursor/skills"

if [[ ! -d "$SKILLS_SRC" ]]; then
  echo "找不到 skills 目录: $SKILLS_SRC" >&2
  exit 1
fi

mkdir -p "$CURSOR_SKILLS"

for name in admin-ui-redesign deep-green-theme; do
  dest="$CURSOR_SKILLS/$name"
  rm -rf "$dest"
  cp -R "$SKILLS_SRC/$name" "$dest"
  echo "已安装: $dest"
done

echo ""
echo "完成。请重启 Cursor，对话中使用："
echo "  请按 admin-ui-redesign + deep-green-theme 改版 src/views/xxx/Page.vue"
