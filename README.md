# フィボナッチ数列を返すAPIサービスの開発
## Shunsuke Sakai

### 初期化
`rails new fib_api`
### ソースコードの構成
以下を実装した。
- Model
  - `#app/models/fib.rb`
  - パラメータ n を引数としてフィボナッチ数列の n番目を計算し、JSON形式で結果を返すメソッドを定義

- Controller
  - `#app/controllers/fib_controller.rb`
  - 入力パラメータ n を取得し、モデルメソッドを動かし、結果に応じて返すレスポンスを定義

- Routing
  - `#config/routes.rb`
  - エンドポイントのルーティングを定義

- RSpec
  - `#spec/models/fib_spec.rb`
  - モデルに実装したロジックについて、ユニットテストを実装
  - 各条件分岐に対するテストケースを列挙し、C1カバレッジを確保

### デプロイ
Heroku上で新しいアプリ（fibapi）を作成し、以下の手順でデプロイし、エンドポイントURLを取得
```
$ heroku login
$ heroku git:remote -a fibapi
$ git push origin main
$ heroku open
```
エンドポイントURL：https://fibapi-9c2c6f912ac1.herokuapp.com/fib

### 動作確認例
```
$ curl -X GET -H "Content-Type: application/json" "https://fibapi-9c2c6f912ac1.herokuapp.com/fib?n=5"
{"result":5}

$ curl -X GET -H "Content-Type: application/json" "https://fibapi-9c2c6f912ac1.herokuapp.com/fib?n=0"
{"status":400,"message":"無効な入力：nは正の整数でなければいけません。"}

$ curl -X GET -H "Content-Type: application/json" "https://fibapi-9c2c6f912ac1.herokuapp.com/fib?n='invalid'"
{"status":400,"message":"無効な入力：nは正の整数でなければいけません。"}
```
