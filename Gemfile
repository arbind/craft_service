source 'https://rubygems.org'

ruby "2.0.0"
gem 'rails', '~>4.0.0'

gem 'mongoid', github: 'mongoid/mongoid', ref: '3b1ada6'
gem 'jbuilder', '~> 1.0.1'

gem 'newrelic_rpm'

gem 'sass-rails', '~> 4.0.0'
gem 'haml-rails', '~> 0.4'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'

group :production do
  gem 'thin'
end

group :doc do # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'rspec-rails', group: [:development, :test]
gem 'database_cleaner', group: :test
gem 'factory_girl', group: :test