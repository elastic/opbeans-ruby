source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'elastic-apm'
gem 'foreman'
gem 'lograge'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.2.1'

group :development do
  gem 'bootsnap'
  gem 'listen'
end
