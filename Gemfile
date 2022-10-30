source "https://rubygems.org"

ruby "3.1.2"

gem "rails", "~> 7.0.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "jsbundling-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "cssbundling-rails"

gem "carrierwave"

gem "carrierwave-aws"

gem "aws-sdk-rails"

gem "rmagick"

gem "fog-aws"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap" # require: false

gem "devise"

gem "devise-i18n"

gem "mailjet"

gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "capistrano", '~> 3.11'
  gem "capistrano-rails", '~> 1.4'
  gem "capistrano-passenger", '~> 0.2.0'
  gem "capistrano-rbenv", '~> 2.1', '>= 2.1.4'
  gem "capistrano-bundler"
  gem "web-console"
end

group :production do
  gem "pg", "~> 1.1"
end
