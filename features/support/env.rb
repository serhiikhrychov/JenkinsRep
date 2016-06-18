$: << File.dirname(__FILE__)+'/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || 'production').to_sym
raise "You need to create a configuration file named '#{ENVIRONMENT}.yml' under lib/config" unless File.exists? "#{File.dirname(__FILE__)}/../../lib/config/#{ENVIRONMENT}.yml"

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'faker'
require 'env_config'
require 'optimize_hit'
require 'pages'
require 'common_helper'
require 'support/string'
require 'gmail'
#require 'capybara/poltergeist'
require 'cgi'
require 'sauce/capybara'
require 'sauce'

World(CommonHelper)

Capybara.configure do |config|

  driver = EnvConfig.get :driver

  case driver

    when 'selenium'
      config.default_driver = :selenium
      config.javascript_driver = :selenium
    when 'sauce'
      config.default_driver = :sauce
      config.javascript_driver = :sauce
    else
      raise ArgumentError.new "driver: #{driver} is not supported"
  end

  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = 10
  config.app_host = EnvConfig.get :url

  #capybara 2.1 config options
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end

case Capybara.default_driver
  when :selenium
    Capybara.register_driver :selenium do |app|
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile["browser.cache.disk.enable"] = false
      profile["browser.cache.memory.enable"] = false
      profile.add_extension './features/support/extensions/JSErrorCollector.xpi'
      Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
    end
  when :sauce
    # Capybara.register_driver :sauce do |app|
    #
    # end
    Sauce.config do |config|
      config[:start_tunnel] = true
      config[:browsers] = ["Windows XP", "Internet Explorer", "8"]
      config[:username] = 'dejarnett'
      config[:access_key] = '522a258f-e15e-4868-8036-e082c43bb8dc'
    end
  else
    raise ArgumentError.new "driver: #{driver} is not supported"
end

 #Capybara.register_driver :selenium do |app|
 #
 #
 #      # IF YOU WANT USE CHROME:
 #caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => %w["--incognito"]})
 #Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps})
 #
 #
 #      #IF YOU WANT USE FIREFOX:
 ##profile = Selenium::WebDriver::Firefox::Profile.new
 ##profile["browser.cache.disk.enable"] = false
 ##profile["browser.cache.memory.enable"] = false
 ##profile.add_extension './features/support/extensions/JSErrorCollector.xpi'
 ##Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
 #
 ##IF YOU WANT USE IE:
 ##  Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
 #
 #
 #end


SitePrism.configure do |config|
  config.use_implicit_waits = false
end

Before('@IE') do
  @current_browser="IE"
end

Before('@chrome') do
  @current_browser="Chrome"
end

Before('@FF') do
  @current_browser="FF"
end

Before do

  Capybara.register_driver :selenium do |app|


    # IF YOU WANT USE CHROME:
    if @current_browser == "Chrome"
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => %w["--incognito"]})
    Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps})

      #IF YOU WANT USE IE:
    elsif @current_browser == "IE"
      Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)

      #IF YOU WANT USE FIREFOX:
    elsif @current_browser == "FF"
      profile = Selenium::WebDriver::Firefox::Profile.new
      #profile["browser.cache.disk.enable"] = false
      #profile["browser.cache.memory.enable"] = false
      #profile.add_extension './features/support/extensions/JSErrorCollector.xpi'
      Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)

      else puts "Undefined browser"
  end

  end


  page.driver.browser.manage.window.maximize
  @random_string = Faker::Lorem.characters(5)

end

After do |scenario|

  #if page.driver.to_s.match("Selenium")
  #  errors = page.execute_script("return window.JSErrorCollector_errors.pump()")
  #
  #  if errors.any?
  #    puts '-------------------------------------------------------------'
  #    puts "Found #{errors.length} javascript #{pluralize(errors.length, 'error')}"
  #    puts '-------------------------------------------------------------'
  #    errors.each do |error|
  #      puts "    #{error["errorMessage"]} (#{error["sourceName"]}:#{error["lineNumber"]})"
  #    end
  #    raise "Javascript #{pluralize(errors.length, 'error')} detected, see above"
  #  end
  #end

  if scenario.failed?
    Dir::mkdir('screenshots') unless File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    page.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  #page.driver.browser.manage.delete_all_cookies
end

# at_exit { @browser.quit }