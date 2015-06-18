require 'rbconfig'
require 'cucumber/formatter/unicode'

require 'capybara'
require 'capybara/dsl'
require "capybara/cucumber"
require 'capybara-screenshot/cucumber'

Capybara.default_driver = :selenium
Capybara.default_wait_time = 120
Capybara.app_host = "https://whatismyip.com/"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara::Screenshot.register_filename_prefix_formatter(:cucumber) do |fault|
  'my_screenshot'
end

Capybara.run_server = false

World(Capybara)

Dir['features/support/*rb'].each { |f| require File.expand_path(f) }
Dir['pages/*rb'].each { |f| require File.expand_path(f) }
