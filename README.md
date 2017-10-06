# rails-1.0.0_study

## Getting started

### Local host
```
$ git clone git@github.com:tnakade/rails-1.0.0_study.git
$ cd rails-1.0.0_study
$ docker build -t hello_app .
$ docker run -it -p 3000:3000 hello_app /bin/bash
```

### Docker container
```
# cd /hello_app
# ./db_setup.sh
# ./script/server
```

- http://lvh.me:3000/
- http://lvh.me:3000/books
- http://lvh.me:3000/books/1
