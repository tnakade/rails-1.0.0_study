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

## Dockerコンテナ内での操作
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

### 他のテーミナルからコンテナに入りたい場合
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

## Railsソースの場所
コンテナ内の`/usr/lib/ruby/gems/1.8/gems/`にある

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

## コンテナとローカルホスト間でのファイルのやりとり
### コンテナ内にファイルを送り込みたい
```
$ docker cp /path/to/hoge <コンテナID>:/path/to/fuga/
```

### コンテナ内からファイルを取り出したい
```
$ docker cp <コンテナID>:/path/to/hoge /path/to/fuga/
```

## デバッグについて
- 別のターミナルからコンテナに入る
```
$ docker exec -it <コンテナID> /bin/bash
```

- 止めたい位置にブレークポイントを置く(コンテナ内のファイルを編集)
```
class BookController < ApplicationController

  def index
    @books = Book.find(:all)
    breakpoint "Stop the world"
  end
end
```

- breakpointerを起動する
```
# cd hello_app/
# ./script/breakpointer
No connection to breakpoint service at druby://localhost:42531 (DRb::DRbConnError)
Tries to connect will be made every 2 seconds...
```

- ブレークポイントを置いた位置まで動かす
```
Executing break point "Stop the world" at ./script/../config/../app/controllers/book_controller.rb:5 in `index'
irb(#<BookController:0x7f59a54ead08>):001:0> 
```

- 変数の値を確認する
```
irb(#<BookController:0x7f59a54ead08>):001:0> @books
=> [#<Book:0x7f59a54c92e8 @attributes={"title"=>"\343\201\212\351\207\221\343\201\214\350\262\257\343\201\276\343\202\213\344\272\272\343\200\201\350\262\257\343\201\276\343\202\211\343\201\252\343\201\204\344\272\272", "author"=>"\351\207\221\345\211\215 \345\244\252\351\203\216", "id"=>"1"}>, #<Book:0x7f59a54c9108 @attributes={"title"=>"\343\201\223\343\202\214\343\201\247\343\201\202\343\201\252\343\201\237\343\202\202\345\244\247\351\207\221\346\214\201\343\201\241!", "author"=>"\351\207\221\345\211\215 \345\244\252\351\203\216", "id"=>"2"}>, #<Book:0x7f59a54c9090 @attributes={"title"=>"\347\224\237\343\201\215\346\226\271\343\201\253\347\202\271\346\225\260\343\201\257\347\204\241\343\201\204\343\200\202", "author"=>"\345\206\205\346\263\242 \347\224\237\344\270\200", "id"=>"3"}>]
irb(#<BookController:0x7f59a54ead08>):002:0> 
```
