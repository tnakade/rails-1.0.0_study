#! /bin/bash

/etc/init.d/mysql status

if [ $? != 0 ]; then
  /etc/init.d/mysql start
fi

mysql -e 'create database hello_app_development;'
mysql -D hello_app_development -e 'create table books (id INT NOT NULL AUTO_INCREMENT, title CHAR(255) NOT NULL, author CHAR(255), PRIMARY KEY (id));'
mysql -D hello_app_development -e 'insert into books values(1, "お金が貯まる人、貯まらない人", "金前 太郎");'
mysql -D hello_app_development -e 'insert into books values(2, "これであなたも大金持ち!", "金前 太郎");'
mysql -D hello_app_development -e 'insert into books values(3, "生き方に点数は無い。", "内波 生一");'
mysql -D hello_app_development -e 'select * from books'
