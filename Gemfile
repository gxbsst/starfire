if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
#source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'passenger'

group :development, :test do
  gem "better_errors", '0.2.0'
  gem "binding_of_caller", '0.6.8'
  gem 'pry'  # "binding.pry" in action
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.0.0'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Refinery CMS
gem 'refinerycms', '~> 2.0.0', :git => 'git://github.com/refinery/refinerycms.git', :branch => '2-0-stable'

# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-i18n', '~> 2.0.0'
gem "refinerycms-news", '~> 2.0.0'
#  gem 'refinerycms-blog', '~> 2.0.0'
#  gem 'refinerycms-inquiries', '~> 2.0.0'
#  gem 'refinerycms-search', '~> 2.0.0'
#  gem 'refinerycms-page-images', '~> 2.0.0'

gem 'gmaps4rails'
gem 'geocoder', :git => 'git://github.com/alexreisner/geocoder.git'
gem 'fastthread', :git => 'git://github.com/zoltankiss/fastthread.git'

gem 'backbone-on-rails'

gem 'capistrano'
gem 'rvm-capistrano'

gem "mini_magick"

gem 'refinerycms-tires', :path => 'vendor/extensions'
