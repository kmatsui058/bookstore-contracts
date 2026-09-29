# 書店の契約リポジトリ

このドキュメントは[ドキュメント作成ガイドライン](/guides/documentation.md)に準拠する必要があります。

書店のオンライン注文を題材に、ドメインモデルを正本として API の定義と仕様を揃えるやり方を示すサンプルです。

- [ドメインモデルの図（LikeC4）](c4/#/view/index/) - コンテキストマップから各コンテキストの語までをたどれる
- [ドメインモデル](/domain/README.md) - モデルの置き場所と、検査・生成の仕方
- [ガイドライン](/guides/README.md) - モデル・ドキュメント・要件と仕様書の書き方
- [仕様](/specs/README.md) - サービスリポジトリから同期した、確定した仕様

## 正本と生成物の関係

| 正本 | そこから作るもの |
|---|---|
| ドメインモデル（`docs/domain/**/*.c4`） | 図のサイト（`c4/`）、列挙型の JSON Schema（`docs/domain/**/generated/jsonschema/`） |
| 分割した OpenAPI の定義（`ordering/definitions/src/openapi/`） | まとめた OpenAPI（`ordering/definitions/openapi/openapi.yaml`）。列挙型は上の JSON Schema を取り込む |
| サービスリポジトリの `openspec/specs/` | このリポジトリの `docs/specs/`（同期） |
