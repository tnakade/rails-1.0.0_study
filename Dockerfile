FROM tnakade/docker-rails-1.0.0:latest

RUN apt-get install locales && echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
RUN echo "export LANG=ja_JP.utf8" >> ~/.bashrc && echo "export LS_OPTIONS='--color=auto'" >> ~/.bashrc && echo "alias ll='ls $LS_OPTIONS -l'" >> ~/.bashrc

COPY ./hello_app /hello_app
CMD ["/hello_app/start.sh"]
