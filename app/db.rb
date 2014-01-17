# encoding: utf-8
require 'active_record'
require 'yaml'

module DB

  # DBへ接続させるためのクラスメソッド
  def self.connect(root_dir, rack_env)
    database_yml_path = File.join(root_dir, 'config', 'database.yml')
    database_yml      = YAML.load_file(database_yml_path)
    connection_data   = database_yml[rack_env]

    # SQLite3だったらデータベースファイルのパスをアプリのルートディレクトリからのファイルパスへ変更する
    if connection_data[:adapter] == 'sqlite3'
      connection_data[:database] = File.join(root_dir, connection_data[:database])
    end

    ActiveRecord::Base.establish_connection(
      connection_data
    )
  end

  # DBへの接続を終了させるクラスメソッド
  def self.close
    ActiveRecord::Base.connection.close
  end
end
