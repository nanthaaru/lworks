require 'rbconfig'
require 'cucumber/formatter/unicode'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'

Capybara.default_driver = :selenium
Capybara.default_wait_time = 30
Capybara.app_host = 'https://na14.salesforce.com'
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara::Screenshot.register_filename_prefix_formatter(:selenium) do |fault|
  'my_screenshot'
end

Capybara.run_server = false

World(Capybara)

Dir['features/support/*rb'].each { |f| require File.expand_path(f) }