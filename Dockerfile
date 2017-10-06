FROM tnakade/docker-rails-1.0.0:latest

COPY ./hello_app /hello_app
CMD ["/hello_app/script/server"]
