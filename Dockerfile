FROM ruby:2.5

WORKDIR /app

ADD Gemfile Gemfile.lock /app
RUN bundle update

ADD . /app

COPY --from=opbeans/opbeans-frontend:latest /app/build /app/frontend/build

CMD ["bin/boot"]
