source "https://rubygems.org"

ruby "3.1.2"

gem "rails", "~> 7.0.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "jsbundling-rails"

gem "omniauth", "~> 2.1"

gem "omniauth-github"

gem "omniauth-vkontakte", "=1.7"

gem "omniauth-rails_csrf_protection", "~> 1.0"

gem "turbo-rails"

gem "stimulus-rails"

gem "cssbundling-rails"

gem "aws-sdk-rails"

gem "aws-sdk-s3", require: false

gem "rmagick"

gem "image_processing", ">= 1.2"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap" # require: false

gem "devise"

gem "devise-i18n"

gem "mailjet"

gem "pundit"

gem "resque"

gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec"
  gem "pundit-matchers"
end

group :development do
  gem "capistrano", '~> 3.11'
  gem "capistrano-rails", '~> 1.4'
  gem "capistrano-passenger", '~> 0.2.0'
  gem "capistrano-rbenv", '~> 2.1', '>= 2.1.4'
  gem "capistrano-bundler"
  gem "web-console"
end
