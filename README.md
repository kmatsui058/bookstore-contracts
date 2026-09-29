# bookstore-contracts

勉強会用のサンプルです。書店のオンライン注文を題材に、複数のサービスが共有する「契約リポジトリ」を示します。

## このサンプルで示すこと

- ドメインモデル（[LikeC4](https://likec4.dev/)）を業務要件の単一情報源（SSOT）にする
- 列挙型の JSON Schema をモデルから生成し、サービスの OpenAPI の定義はそれを `$ref` で取り込む（値を手で書かない）
- mkdocs のドキュメントと LikeC4 の図のサイト（`/c4/`）を1つのサイトとして公開する
- サービスリポジトリ（[bookstore-ordering](https://github.com/kmatsui058/bookstore-ordering)）は、このリポジトリを git サブモジュールとして取り込み、まとめた OpenAPI からコードを生成する。確定した仕様は、サービスリポジトリの OpenSpec から `docs/specs/` に同期する

## ディレクトリ

```
docs/
  index.md                  ドキュメントサイトのトップ
  guides/                   ガイドライン（モデリング・ドキュメント・要件と仕様書）
  domain/                   ドメインモデル（LikeC4 のモデルのルート）
    spec.c4 global.c4       要素と関係の種類、次元
    context-map*.c4 strategy.c4 external-contexts.c4   コンテキストマップ
    bookstore/<コンテキスト>/  各コンテキストのモデル。generated/jsonschema/ は生成物
    sagas/                  コンテキストをまたぐ流れ（動的ビュー）
    context-map/            LikeC4 と生成の道具（package.json・Taskfile・jq）
  specs/                    サービスリポジトリから同期した仕様（直接編集しない）
ordering/
  definitions/src/openapi/  注文 API の OpenAPI の定義（分割して書く）
  definitions/openapi/      まとめた OpenAPI（生成物。コミットする）
tools/pages/                ドキュメントサイトを作るスクリプト
.github/workflows/          モデルの検査・OpenAPI の検査・サイトの公開
```

## 動かし方

Node 22（`.nvmrc`）、[Task](https://taskfile.dev/)、jq、Python（mkdocs）を使います。

```sh
# ドメインモデル
cd docs/domain/context-map
npm ci
npx likec4 start ..          # 図をブラウザでプレビュー
npx likec4 validate ..       # 検査
task generate:enums          # 列挙型の JSON Schema を生成

# 注文 API の定義
cd ordering
task lint                    # Spectral で検査
task bundle                  # definitions/openapi/openapi.yaml にまとめる

# ドキュメントサイト（site/ に作る）
pip install -r requirements.txt
bash tools/pages/build-docs-site.sh
```

図のサイトの公開パスは `LIKEC4_BASE`（既定値は `/bookstore-contracts/c4/`）で変えられます。手元で `site/` をルートとして配信するときは `LIKEC4_BASE=/c4/` を付けてください。
