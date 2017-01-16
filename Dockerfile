FROM ruby:2.3.3-onbuild

EXPOSE 6868
CMD rackup -I lib -o 0.0.0.0 -p 6868 config.ru
