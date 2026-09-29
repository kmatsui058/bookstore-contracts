# delta specs 作成ガイドライン

このドキュメントは[ドキュメント作成ガイドライン](/guides/documentation.md)に準拠する必要があります。

_[要件・仕様書管理に戻る](./README.md)_

delta specs（change の `specs/`）は、満たすべき振る舞い（Requirements）の差分を書くアーティファクトです。archive すると `openspec/specs/` に統合され、確定した仕様になります。

## 守ること

- proposal.md で宣言した Capability ごとに `specs/<capability>/spec.md` を作る
- 差分は `## ADDED Requirements`・`## MODIFIED Requirements`・`## REMOVED Requirements` にだけ書く（archive はこの3つしか統合しない）
- 各 Requirement にシナリオを Given/When/Then で書く
- MODIFIED には、変更後の Requirement の全文を書く
- 実装の詳細・技術の選択は書かない（design.md に書く）
