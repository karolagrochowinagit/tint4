require 'rspec'
require 'selenium-webdriver'

class AbstractPage

  @@driver = nil

  def initialize(driver)

    @@driver=driver

  end

  def get_title

    @@driver.title

  end


  def close_browser

    @@driver.quit

  end

end