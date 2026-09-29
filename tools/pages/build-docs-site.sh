#!/usr/bin/env bash
# 公開するドキュメントサイトを site/ に作る。サイトの作り方を変えるときは、公開の設定ではなくこのスクリプトを変える。
#
# 1. mkdocs で Markdown のドキュメントを site/ に作る
# 2. LikeC4 でドメインモデル（docs/domain の .c4）の図のサイトを作り、site/c4/ に置く
#    ドキュメントからは c4/#/view/<ビューID>/ でリンクしている。LikeC4 は Node 22 以上が要る（.nvmrc）
#
# LIKEC4_BASE: 図のサイトを置く公開パス。GitHub Pages のプロジェクトサイト（https://<owner>.github.io/<リポジトリ名>/）
#              ではリポジトリ名がパスに入るため、既定値は /bookstore-contracts/c4/。ルートで公開するなら /c4/ にする
set -euo pipefail

cd "$(dirname "$0")/../.."

likec4_base="${LIKEC4_BASE:-/bookstore-contracts/c4/}"

mkdocs build

likec4_dir=docs/domain/context-map
if [ ! -d "$likec4_dir/node_modules" ]; then
  npm ci --prefix "$likec4_dir" --no-audit --no-fund
fi
(cd "$likec4_dir" && npx likec4 build --base "$likec4_base" --use-hash-history -o ../../../site/c4 ..)
