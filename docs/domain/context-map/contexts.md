# コンテキストの一覧

このドキュメントは[ドキュメント作成ガイドライン](/guides/documentation.md)・[モデリングガイドライン](/guides/domain-modeling.md)に準拠する必要があります。

_[戻る](./README.md)_

コンテキストマップのモデル（`docs/domain/context-map.c4`・`external-contexts.c4`・`strategy.c4`）にあるコンテキストの一覧です。各コンテキストのモデルは、この表の FQN の要素の下に、ドキュメントのディレクトリに置きます。列挙型の JSON Schema の生成（`task generate:enums`）は、この表のドキュメントのディレクトリの列を読みます。

## コンテキスト

| 領域 | コンテキストの和名 | 英名（summary） | 要素 ID | FQN | ドキュメントのディレクトリ |
|---|---|---|---|---|---|
| 書店 | 商品カタログ | Catalog | ctlg | bks.bkst.ctlg | docs/domain/bookstore/catalog/ |
| 書店 | 注文 | Ordering | ordr | bks.bkst.ordr | docs/domain/bookstore/ordering/ |
| 書店 | 請求 | Billing | bill | bks.bkst.bill | docs/domain/bookstore/billing/ |
| 外部 | 決済代行 | PaymentGateway | pgw | pgw | なし |
| 外部 | 配送業者 | Carrier | crr | crr | なし |
