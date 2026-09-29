# ドメインモデルの作業場所

このドキュメントは[ドキュメント作成ガイドライン](/guides/documentation.md)・[モデリングガイドライン](/guides/domain-modeling.md)に準拠する必要があります。

_[戻る](../README.md)_

ドメインモデル（LikeC4 のモデル `docs/domain/**/*.c4`）を扱う道具を置く場所です。モデルのルートは `docs/domain/`（`likec4.config.json` がある）です。

- [コンテキストの一覧](/domain/context-map/contexts.md)

## 使い方

```sh
cd docs/domain/context-map
npm ci                       # LikeC4 を入れる
npx likec4 start ..          # ブラウザでプレビュー
npx likec4 validate ..       # 構文・参照の検査
task generate:enums          # 列挙型の JSON Schema を生成する
```

## 列挙型の JSON Schema の生成

`task generate:enums` は、モデルを JSON に書き出し、[コンテキストの一覧](/domain/context-map/contexts.md)の各コンテキストの列挙型を `docs/domain/<業務ドメイン>/<コンテキスト>/generated/jsonschema/<英名>.json` に書き出します。API の定義はこのファイルを `$ref` で取り込み、値を手で書きません。

- `enum` は値の要素の ID（`metadata.value` があればその値）
- `title` は列挙型の和名、`x-enumDescriptions` は値の和名
- 英名（`summary`）のない列挙型があると失敗する

生成物はコミットします。CI は生成し直して差分が出たら失敗にします。

## LikeC4 の事情（ガイドラインの規則の背景）

- 関係の種類にタグを付けられないため、次元は `global` の `predicateGroup` に種類の集合として定義している
- 表示していない子要素どうしの関係も、親の箱どうしの線にまとめて描かれる。コンテキストマップのビューで戦略の次元だけを描くのはこのため
- `description` の中のリンクは、LikeC4 が検査も書き換えもしない
- ビューのタイトルを ` / ` で区切ると、ナビゲーションでフォルダとして表示される
