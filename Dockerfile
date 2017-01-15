FROM ruby:2.3.3-onbuild

EXPOSE 9292
CMD rackup -I lib -o 0.0.0.0 config.ru
