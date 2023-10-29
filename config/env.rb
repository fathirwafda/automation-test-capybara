require "capybara/cucumber"
require "capybara-screenshot/cucumber"
require "capybara/rspec"
require "selenium-webdriver"
require "pry"
require "yaml"
require "dotenv"
require "site_prism"
require "httparty"
require "filesize"
require "fileutils"
require 'json'
require 'report_builder'

# configuration for desktop
Dotenv.load

browser = (ENV['BROWSER'] || 'chrome').to_sym
Capybara.app_host = ENV['BASE_URL'] || 'https://www.saucedemo.com'
wait_time = 60 * 5

puts "Browser   : #{browser}"
puts "Base Url   : #{Capybara.app_host}"

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-notifications')
  options.add_argument('--window-size=1366,768')
  # handle basic auth
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = wait_time
  client.read_timeout = wait_time
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options,
    http_client: client
  )
end

Capybara.configure do |config|
  config.default_max_wait_time = 20
end

Capybara::Screenshot.register_driver(browser) do |driver, path|
  driver.browser.save_screenshot path
end

Capybara.default_driver = browser
Capybara.save_path = 'screenshots'
Capybara::Screenshot.autosave_on_failure = true

def close_capybara_session
  Capybara.current_session.driver.quit
end

AfterStep do
  unless @api
    begin
      url = URI.parse(current_url)
      puts url
    rescue StandardError
      nil
    end
  end
end
