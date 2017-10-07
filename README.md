# rails-1.0.0_study

## 起動手順

### 初期設定
```
$ git clone git@github.com:tnakade/rails-1.0.0_study.git
$ cd rails-1.0.0_study
```

### dockerイメージをビルドしてコンテナを起動する
```
$ docker build -t hello_app .
$ docker run -it -p 3000:3000 hello_app
```
### ブラウザから動作確認
- http://lvh.me:3000/
- http://lvh.me:3000/books
- http://lvh.me:3000/books/1

## その他
### Railsソースの場所
`/usr/lib/ruby/gems/1.8/gems/`にある

```
# ls -l /usr/lib/ruby/gems/1.8/gems/
total 28
drwxr-xr-x  4 root root 4096 Oct  6 13:11 actionmailer-1.1.5
drwxr-xr-x  5 root root 4096 Oct  6 13:11 actionpack-1.11.2
drwxr-xr-x  5 root root 4096 Oct  6 13:11 actionwebservice-1.0.0
drwxr-xr-x  5 root root 4096 Oct  6 13:11 activerecord-1.13.2
drwxr-xr-x  3 root root 4096 Oct  6 13:11 activesupport-1.2.5
drwxr-xr-x 11 root root 4096 Oct  6 13:11 rails-1.0.0
drwxr-xr-x  6 root root 4096 Oct  6 13:07 rake-0.6.2
```
### コンテナは起動するけどRailsアプリは起動したくない(コンテナ内から起動する)
```
$ docker run -it -p 3000:3000 hello_app /bin/bash
```

#### コンテナ内での操作
- DBのセットアップを行う
```
# cd /hello_app
# ./db_setup.sh
```

- Railsアプリを起動する
```
# ./script/server
```

### 他のテーミナルからもコンテナに入りたい場合
- 別のターミナルを開いて
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED                  STATUS              PORTS                    NAMES
2168f1e02e74        hello_app           "/bin/bash"         Less than a second ago   Up 7 seconds        0.0.0.0:3000->3000/tcp   wonderful_kalam
```
- コンテナに入る (`<コンテナID>`は直前の`docker ps`の`CONTAINER ID`で置き換える)
```
$ docker exec -it <コンテナID> /bin/bash
```

- コンテナ内にファイルを送り込みたい
```
$ docker cp /path/to/hoge <コンテナID>:/path/to/fuga/
```

- コンテナ内からファイルを取り出したい
```
$ docker cp <コンテナID>:/path/to/hoge /path/to/fuga/
```
