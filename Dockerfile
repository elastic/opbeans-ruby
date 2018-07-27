FROM ruby:2.5

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
      && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
      && apt-get update \
      && apt-get install -y yarn \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD . /app
RUN bundle update && yarn

CMD ["bin/boot"]
