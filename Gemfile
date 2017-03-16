source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
# Databases
gem 'activerecord-postgres-earthdistance'
gem 'annotate'
gem 'pg', '~> 0.18'

# Authentication & APIs
gem 'cancan'
gem 'oauth'
gem 'devise'
gem 'omniauth'
gem 'omniauth-withings', github: 'jdjkelly/omniauth-withings'
gem 'omniauth-fitbit'
gem 'omniauth-foursquare', '~> 1.0.0'
gem 'withings', github: 'jdjkelly/withings'
gem 'fitgem'
gem 'foursquare2'
gem 'symmetric-encryption'

# Assets
gem 'bootstrap-sass'
gem 'bootstrap-social-rails'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'font-awesome-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'guard',            require: false
  gem 'guard-rspec',      require: false
  gem 'guard-bundler',    require: false
  gem 'guard-livereload', require: false
  gem 'foreman'
  gem 'pry-rails'
  gem 'thin'
  gem 'ruby_gntp'
  gem 'rack-livereload'
  gem 'parallel_tests'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'spring-commands-rspec'
end

group :test do
	gem 'capybara'
  gem 'rspec'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'minitest' # https://github.com/thoughtbot/shoulda-matchers/issues/408
  gem 'shoulda-matchers'
  gem 'fabrication'
  gem 'database_cleaner'
  gem 'faker'
  gem 'email_spec'
  gem 'webmock'
  gem 'fuubar'
end

group :production do
	gem 'newrelic_rpm'
  gem 'rails_12factor' # Heroku requires this
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
