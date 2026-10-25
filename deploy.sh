#!/usr/bin/env bash
# 构建并同步到 1Panel 站点目录。nginx 切到静态站点后立即生效。
set -euo pipefail
cd "$(dirname "$0")"

zola build
rsync -a --delete public/ /opt/1panel/www/sites/blog.yuugu.re/index/
echo "已同步: /opt/1panel/www/sites/blog.yuugu.re/index ($(du -sh public | cut -f1))"
