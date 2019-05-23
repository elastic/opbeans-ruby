FROM ruby:2.5

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

COPY . /app

COPY --from=opbeans/opbeans-frontend:latest /app/build /app/frontend/build

CMD ["bin/boot"]
