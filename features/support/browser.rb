require 'watir-webdriver'

ENV['environment'] ||= 'local'

puts "Running tests on #{ENV['environment']} environment"

if ENV['environment'] == 'saucelabs'

caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps.platform = 'Windows 7'
caps.version = ''
caps['browserName'] = 'Chrome'
caps[:name] = "Testing BA.com on Sauce"

browser = Watir::Browser.new(
    :remote,
    :url => "http://batest:3f1b0bc4-3781-4c23-ba48-bd45b70c7122@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)
elsif ENV['environment'] == 'headless'
  browser = Watir::Browser.new :phantomjs
else
  browser =Watir::Browser.new :firefox
end

Before ('~@headless') do
  @browser = browser
  @browser.cookies.clear
end

Before ('@headless') do
  @browser = browser
  @browser.cookies.clear
end

at_exit do
  browser.close unless browser.nil?
end