source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'elastic-apm'
gem 'foreman'
gem 'lograge'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'webpacker'

group :development do
  gem 'bootsnap'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
