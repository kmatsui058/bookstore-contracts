# 要件・仕様書管理

このドキュメントは[ドキュメント作成ガイドライン](/guides/documentation.md)に準拠する必要があります。

_[ガイドラインに戻る](../README.md)_

システムの要件・仕様書を [OpenSpec](https://github.com/Fission-AI/OpenSpec) で作り、確定した仕様をこのリポジトリに集めるためのルールです。ガイドライン・API の定義・ドメインモデルは対象外です。

## リポジトリの役割

- OpenSpec は各サービスリポジトリ（例: bookstore-ordering）で運用する。change の作成から archive までを、そのリポジトリで行う
- このリポジトリは、確定した仕様の共有保管庫である。archive したあと、サービスリポジトリの `openspec/specs/` を `docs/specs/<業務ドメイン>/<コンテキスト>/` に同期する
- 各サービスリポジトリの `openspec/config.yaml` から、このディレクトリのガイドラインを参照する

## ライフサイクル

1. [proposal.md](/guides/requirements-specs-management/proposal.md) で、なぜ・何を変えるかを決める
2. [delta specs](/guides/requirements-specs-management/delta-specs.md) で、満たすべき振る舞いの差分を書く
3. [design.md](/guides/requirements-specs-management/design.md) で、どう実現するかを書く
4. [tasks.md](/guides/requirements-specs-management/tasks.md) で、実装の手順に分ける
5. 実装が終わったら archive し、delta specs を `openspec/specs/` に統合する
6. `openspec/specs/` をこのリポジトリの `docs/specs/` に同期する

## 守ること

- 語はドメインモデルで定義されたものを使う。新しい語が要るときは、先にこのリポジトリのモデルを変える
- 1つの情報は1つのアーティファクトにだけ書く（Why は proposal、振る舞いは specs、How は design、手順は tasks）
- `docs/specs/` は同期の出力先なので、このリポジトリで直接編集しない
