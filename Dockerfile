FROM ruby:2.7.6-alpine
RUN mkdir /home/app
WORKDIR /home/app
COPY ./ ./
RUN apk add --no-cache postgresql-dev build-base nodejs tzdata postgresql-client
RUN bundle install
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
