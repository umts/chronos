source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end

# rails
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'

gem 'turbolinks', '~> 5'

# database
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'paper_trail', '~> 8.1'

# css/sass
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17'

# haml
gem 'haml', '~> 5.0'
gem 'haml-rails', '~> 1.0'

gem 'jquery-rails', '~> 4.3'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  # debugging
  gem 'pry-byebug', '~> 3.6'
end

group :development do
  # local server
  gem 'spring'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # debugging
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'better_errors', '~> 2.4'
end

group :test do
  # testing
  gem "rspec-rails", "~> 3.7"
  gem 'factory_bot_rails', '~> 4.8'
end
