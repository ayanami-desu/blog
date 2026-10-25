#!/usr/bin/env bash
# 新建一篇草稿：./new.sh <slug>
# slug 只用于 URL，建议英文/数字/连字符；中文也行（路径保留 UTF-8）。
set -euo pipefail
cd "$(dirname "$0")"
slug=${1:-}
if [[ -z "$slug" ]]; then
  echo "用法: ./new.sh <slug>" >&2
  exit 1
fi

read -r y m d <<<"$(date +'%Y %m %d')"
ts=$(date +'%Y-%m-%dT%H:%M:%S+08:00')
file="content/blog/${slug}.md"

if [[ -e "$file" ]]; then
  echo "$file 已存在" >&2
  exit 1
fi

cat >"$file" <<EOF
+++
title = ""
date = ${ts}
path = "${y}/${m}/${d}/${slug}"
+++

EOF

echo "已创建 $file"
${EDITOR:-vim} "$file"
echo
echo "预览: zola serve   (http://127.0.0.1:1111)"
echo "发布: ./deploy.sh"
