source 'https://rubygems.org'
ruby '2.6.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'elastic-apm'
gem 'foreman'
gem 'graphql'
gem 'http'
gem 'lograge'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.2'
gem 'tzinfo-data'

group :development do
  gem 'bootsnap'
  gem 'listen'
end

gem 'graphiql-rails', group: :development