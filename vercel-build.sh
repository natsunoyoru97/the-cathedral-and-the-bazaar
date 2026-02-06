#!/bin/bash
set -e # 任何一步失败则整体失败

# 1. 安装 mdBook
curl -sSLf https://github.com/rust-lang/mdBook/releases/download/v0.4.40/mdbook-v0.4.40-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C /tmp
mv /tmp/mdbook /usr/local/bin/
mdbook --version || exit 1

# 2. 安装 mdbook-admonish
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/tommilligan/mdbook-admonish/releases/latest/download/mdbook-admonish-installer.sh | sh
which mdbook-admonish || exit 1

# 3. 执行构建
mdbook build