source 'https://rubygems.org'
ruby '2.7.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'sprockets', '~> 3'
gem 'elastic-apm'
gem 'foreman'
gem 'http'
gem 'lograge'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'tzinfo-data'

group :development do
  gem 'bootsnap'
  gem 'listen'
end
