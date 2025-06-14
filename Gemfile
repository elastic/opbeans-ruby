source 'https://rubygems.org'

ruby '2.7.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'sprockets'
gem 'elastic-apm', '4.8.0'
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
