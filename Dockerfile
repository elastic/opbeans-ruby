FROM ruby:2.6.6-alpine

WORKDIR /app

## Dependencies for nokogiri and pg
RUN apk update && \
    apk --no-cache add build-base && \
    apk --no-cache add postgresql-dev && \
    rm -rf /var/cache/apk/*

COPY Gemfile Gemfile.lock /app/
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

COPY . /app

COPY --from=opbeans/opbeans-frontend:latest /app/build /app/frontend/build

CMD ["bin/boot"]
