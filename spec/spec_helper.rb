require 'rubygems'
require 'rspec'

ROOT_PATH = File.expand_path(File.dirname(__FILE__))
LIB_PATH = File.join(ROOT_PATH, '..', 'lib')
$: << LIB_PATH if File.directory?(LIB_PATH) && !$:.include?(LIB_PATH)

# Require the library
require 'ruby_style_guide'

include RubyStyleGuide

# Require support files
Dir[ROOT_PATH + "/spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  # config.mock_with :rspec
end