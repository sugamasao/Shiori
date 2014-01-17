# Ruby編サンプルスクリプト

## これはなに
URLを登録するブックマークサイトです。
提供する機能は以下の通り

- URLの登録
- URLの閲覧（ページネイションあり）

## 使うためには

以下の環境が準備されていることを前提としています

- Ruby 2.0.0 以上
- gemパッケージ bundlerのインストール（gem install bundler）
- sqlite3

### データベースのセットアップ
```
$ cd db/
$ sqlite3 sqlite.db < schema.sqlite3.sql
```

### 各種gemのインストール

```
$ bundle install --without production
```

### アプリケーションの起動

```
$ bundle exec rackup
```

またはUnicornで起動します。

```
$ bundle exec unicorn --port 9292
```

これで http://localhost:9292 にアクセスできるようになり、アプリケーションの操作が行えます。

## テストを実行するためには

テスト用のデータベースのセットアップを行う必要があります

```
$ cd db/
$ sqlite3 sqlite.test.db < schema.sqlite3.sql
```

データベースの作成が終わったら以下のコマンドでRSpecを実行します。

```
$ bundle exec rspec
```

テストが実行されると、カバレッジがcoverageディレクトリに出力されます。

## RakeタスクでCSVを出力する

rakeコマンドでcsvというタスクを実行することで、データベースに保存されているbookmark.csvというCSVファイルを生成します。

```
$ bundle exec rake csv
```

RACK_ENVの値としてdevelopmentが使用されます。もしproduction等別の設定を利用する場合は以下のようにします。

```
$ bundle exec rake csv RACK_ENV=production
```

