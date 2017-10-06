FROM lpenz/debian-etch-amd64:latest

RUN apt-get update && apt-get install -y wget
RUN apt-get install -y ruby rdoc
RUN cd /usr/local && wget http://pkgs.fedoraproject.org/repo/pkgs/rubygems/rubygems-1.2.0.tgz/b77a4234360735174d1692e6fc598402/rubygems-1.2.0.tgz && tar xzf rubygems-1.2.0.tgz && cd rubygems-1.2.0/ && ruby setup.rb
RUN /usr/local/rubygems-1.2.0/bin/gem install -y rake -v "0.7.3"
RUN /usr/local/rubygems-1.2.0/bin/gem install -y rails -v "1.0.0"
RUN apt-get install -y libmysql-ruby mysql-server

COPY ./hello_app /hello_app
CMD ["/hello_app/script/server"]
