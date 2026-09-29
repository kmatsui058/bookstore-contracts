# proposal.md 作成ガイドライン

このドキュメントは[ドキュメント作成ガイドライン](/guides/documentation.md)に準拠する必要があります。

_[要件・仕様書管理に戻る](./README.md)_

proposal.md は、変更の Why（なぜ）と What（何を）を書くアーティファクトです。

## 守ること

- 動機・背景・変更の概要・影響を受ける Capability・影響範囲だけを書く。技術設計は design.md、振る舞いは specs、手順は tasks.md に書く
- 1〜2ページに収める
- Capability は機能領域で切る。change が足す個別の振る舞いごとに切らない
- 既存の Capability を変えるときは、既存の名前をそのまま使う
