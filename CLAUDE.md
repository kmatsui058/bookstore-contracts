# CLAUDE.md

書店のオンライン注文を題材にした、契約リポジトリのサンプルです。ドメインモデル（LikeC4）が業務要件の正本で、API の定義と仕様はそれに従います。

## 最初に読むもの

- `docs/guides/domain-modeling.md` - モデルの書き方（守ること）
- `docs/guides/documentation.md` - Markdown とリンクの書き方
- `docs/guides/requirements-specs-management/README.md` - 仕様書の流れと `docs/specs/` の扱い
- `docs/domain/context-map/contexts.md` - コンテキストとディレクトリの一覧

## モデルを変えるとき

1. まずモデル（`docs/domain/**/*.c4`）の要素と関係を変える
2. 次に、その要素を描くビューを直す
3. `cd docs/domain/context-map && npx likec4 validate .. && task generate:enums` で検査し、列挙型の JSON Schema を生成し直す
4. API の定義を変えたら `cd ordering && task lint && task bundle` を実行する
5. 生成物（`generated/jsonschema/`・`ordering/definitions/openapi/openapi.yaml`）も一緒にコミットする。CI は生成し直して差分が出たら失敗にする

## してはいけないこと

- 語・コンテキストの境界・統合パターンなど、ドメインの意思決定を自分で決めない。案を示して人間に決めてもらう
- 生成物を手で直さない。列挙型の値を API の定義に直接書かない
- `docs/specs/` を直接編集しない（サービスリポジトリからの同期先）

## コミット

- 日本語で、意味のあるひと固まりごとに細かくコミットする。本文には「なぜそうしたか」を書く
- 履歴を書き換えない（amend・rebase・force push をしない）
