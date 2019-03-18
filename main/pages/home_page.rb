require_relative '../../../src/main/pages/abstract_page'
require_relative '../../../src/main/pages/log_in_page'

class HomePage < AbstractPage

  def initialize (driver)
    super (driver)
  end

  def go_to_home_page
    @@driver.navigate.to "http://tintup.com"
    return HomePage.new(@@driver)
  end

  def click_on_login
    @@driver.find_element(:id, 'login').click
    return LogInPage.new(@@driver)
  end

end