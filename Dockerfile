FROM ruby:2.7.3-alpine

WORKDIR /app

## Dependencies for nokogiri and pg
RUN apk update && \
    apk --no-cache add build-base && \
    apk --no-cache add postgresql-dev && \
    rm -rf /var/cache/apk/*

COPY Gemfile Gemfile.lock /app/
ENV BUNDLER_VERSION 2.2.15
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

COPY . /app

COPY --from=opbeans/opbeans-frontend:latest /app/build /app/frontend/build

LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.vendor="Elastic" \
    org.label-schema.name="opbeans-ruby" \
    org.label-schema.version="4.0.0" \
    org.label-schema.url="https://hub.docker.com/r/opbeans/opbeans-ruby" \
    org.label-schema.vcs-url="https://github.com/elastic/opbeans-ruby" \
    org.label-schema.license="MIT"

CMD ["bin/boot"]
