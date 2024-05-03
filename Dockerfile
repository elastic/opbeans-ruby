ARG RUBY_IMAGE="ruby:2.7.3-alpine"
FROM ${RUBY_IMAGE}
ARG RUBY_IMAGE

WORKDIR /app

## Dependencies for nokogiri and pg
RUN apk update && \
    apk --no-cache add build-base && \
    apk --no-cache add postgresql-dev && \
    rm -rf /var/cache/apk/*

COPY Gemfile Gemfile.lock /app/
ENV BUNDLER_VERSION 2.4.22
RUN gem install bundler -v ${BUNDLER_VERSION}
RUN bundle install --jobs 20 --retry 5

COPY . /app

COPY --from=opbeans/opbeans-frontend:latest /app/build /app/frontend/build

LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.vendor="Elastic" \
    org.label-schema.name="opbeans-ruby" \
    org.label-schema.version="4.7.3" \
    org.label-schema.url="https://hub.docker.com/r/opbeans/opbeans-ruby" \
    org.label-schema.vcs-url="https://github.com/elastic/opbeans-ruby" \
    org.label-schema.license="MIT" \
    org.opencontainers.image.vendor="Elastic" \
    org.opencontainers.image.title="opbeans-ruby" \
    org.opencontainers.image.version="4.7.3" \
    org.opencontainers.image.url="https://hub.docker.com/r/opbeans/opbeans-ruby" \
    org.opencontainers.image.source="https://github.com/elastic/opbeans-ruby" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.base.name="${RUBY_IMAGE}"

CMD ["bin/boot"]
