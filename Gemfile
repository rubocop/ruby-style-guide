# A sample Gemfile
source "http://rubygems.org"

gem 'pdfkit', '~>0.5.2'
gem 'redcarpet', '~>1.17.2'
gem 'albino', '~>1.3.3'
gem 'nokogiri', '~>1.5.0'

group :development, :test do
  gem 'guard', '~>0.6.2'
  gem 'guard-bundler', '~>0.1.3'
  gem 'guard-rspec', '~>0.4.3'
  gem 'rspec', '~>2.6.0'
  gem 'mocha', "~>0.10.0"

  platforms :ruby do
    # Require rbconfig to figure out the target OS
    require 'rbconfig'

    unless ENV['TRAVIS']
      if RbConfig::CONFIG['target_os'] =~ /darwin/i
        gem 'rb-fsevent', require: false
        gem 'ruby-growl', require: false
        gem 'growl', require: false
      end
      if RbConfig::CONFIG['target_os'] =~ /linux/i
        gem 'rb-inotify', require: false
        gem 'libnotify', require: false
      end
    end
  end
end