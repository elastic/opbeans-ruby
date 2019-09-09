source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'elastic-apm' #, path: '../apm-agent-ruby'
gem 'foreman'
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
