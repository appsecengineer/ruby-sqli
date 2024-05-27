FROM ruby:3.0.2

ADD . /sql_injection
WORKDIR /sql_injection
RUN bundle install

ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES true

EXPOSE 8880
CMD ["bash"]
