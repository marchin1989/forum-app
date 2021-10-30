#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

main() {
  sudo apt update

  # nginxインストール
  sudo apt install -y nginx

  # pipをインストール
  sudo apt install -y python3-pip

  # uvicornのインストール
  pip install uvicorn

  # TODO 掲示板アプリソースのインストール

  # PATHを通す
  echo 'PATH="$HOME/.local/bin/:$PATH"' >> ~/.profile
  source ~/.profile

  # fast apiインストール
  pip install fastapi

  # mysqlのインストール
  sudo apt install -y mysql-server mysql-client

  # データベースの初期化
  sudo mysql -u root < init.ddl

  # mysqlとpythonのコネクター
  pip install mysql-connector-python

  # uvicorn起動
  uvicorn main:app --reload
}

main
