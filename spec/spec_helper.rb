$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rspec_tag_matchers'
require 'rubygems'
require 'bundler'
Bundler.setup

require 'active_support'
require 'action_pack'
require 'action_view'
require 'action_controller'
require 'action_dispatch'

require 'formtastic-bootstrap'

require 'simplecov'
SimpleCov.start if ENV["COVERAGE"]

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include RspecTagMatchers
  config.include CustomMacros
  config.before(:each) do
    Formtastic::Localizer.cache.clear! rescue nil
  end
end

require "action_controller/railtie"
require 'active_model'

# Create a simple rails application for use in testing the viewhelper
module FormtasticTest
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    config.active_support.deprecation = :stderr
  end
end
FormtasticTest::Application.initialize!

require 'rspec/rails'
