require_relative './abstract_page'

class TintPage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_edit_tint
    @@driver.navigate.to "https://www.tintup.com/t/nowyautomatycznytint8/edit/moderate/all"
    return TintPage.new(@@driver)
  end

  def tumb_icon
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.tb > .fab').displayed?}
    @@driver.find_element(:css, '.tb > .fab').click
    return TintPage.new(@@driver)
  end

  def hastag_connection
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.advanced-feed-type-tabedit-content-tb-modal-li-hashtags > a').displayed?}
    @@driver.find_element(:css, '.advanced-feed-type-tabedit-content-tb-modal-li-hashtags > a').click
    return TintPage.new(@@driver)
  end

  def hastag_text(hastag)
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.edit-content-tb-modal-connect-hash-input').displayed?}
    @@driver.find_element(:css, '.edit-content-tb-modal-connect-hash-input').send_keys hastag
    return TintPage.new(@@driver)
  end

  def submit_connection
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.edit-content-tb-modal-connect-hash-btn').displayed?}
    @@driver.find_element(:css, '.edit-content-tb-modal-connect-hash-btn').click
    return TintPage.new(@@driver)
  end

  def added_connection
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.feed-label-without-prefix').displayed?}
    return @@driver.find_element(:css, '.feed-label-without-prefix').text

  end

end