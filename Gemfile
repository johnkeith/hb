source 'https://rubygems.org'
ruby '2.1.3'
### core rails gems

gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

### custom

gem 'devise'
gem 'kaminari'
gem 'jquery-turbolinks' # // may be needed to get javascript working in the future
gem 'unobtrusive_flash'

# handles for '' in forms and keeps them null in db
gem "nilify_blanks"

## by group

group :doc do
	gem 'sdoc', '~> 0.4.0'
end

group :development do
	gem 'spring'
	gem 'spring-commands-rspec'
	gem 'rack-mini-profiler'
end

group :development, :test do
	gem 'rspec-rails'
	gem 'pry'
  gem 'pry-rails'
end

group :production do
	gem 'rails_12factor'
end