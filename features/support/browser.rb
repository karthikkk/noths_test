require 'watir-webdriver'

ENV['environment'] ||= 'local'

puts "Running tests on #{ENV['environment']} environment"

if ENV['environment'] == 'saucelabs'

caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps.platform = 'Windows 7'
caps.version = ''
caps['browserName'] = 'Chrome'
caps[:name] = "NOTHS Test"

browser = Watir::Browser.new(
    :remote,
    :url => "http://noths_test:0bc63523-9155-40fc-ab4b-8bda557ce37d@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)
elsif ENV['environment'] == 'headless'
  browser = Watir::Browser.new :phantomjs
else
  browser =Watir::Browser.new :firefox
end

at_exit do
  browser.close unless browser.nil?
end