require 'rbconfig'
require 'cucumber/formatter/unicode'

require 'capybara'
require 'capybara/dsl'
require "capybara/cucumber"

Capybara.default_driver = :selenium
Capybara.app_host = "https://na14.salesforce.com"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.run_server = false

World(Capybara)

Dir['features/support/*rb'].each { |f| require File.expand_path(f) }
Dir['pages/*rb'].each { |f| require File.expand_path(f) }