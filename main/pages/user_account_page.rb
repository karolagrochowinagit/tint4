require_relative '../../../src/main/pages/abstract_page'
require_relative '../../../src/main/pages/log_in_page'
require_relative '../../../src/main/pages/payment_page'
require_relative '../../../src/main/pages/tint_page'
require_relative '../../../src/main/pages/collaborators_page'

class UserAccountPage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_user_account
    @@driver.navigate.to "https://www.tintup.com/admin"
    return UserAccountPage.new(@@driver)
  end

  def user_account_details
    @@driver.find_element(:id, 'settings_dropdown_toggle').click
    return UserAccountPage.new(@@driver)
  end

  def payment_dropdown
    @@driver.find_element(:xpath, '//a[contains(text(),"Payment")]').click
    return PaymentPage.new(@@driver)
  end

  def add_tint
    @@driver.find_element(:class, 'settings-add-account').click
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @@driver.find_element(:id, 'newTintUsername').displayed?}
    return UserAccountPage.new(@@driver)
  end

  def tint_username(tint)
    @@driver.find_element(:id, 'newTintUsername').send_keys tint
    return UserAccountPage.new(@@driver)
  end

  def tint_username_submit
    @@driver.find_element(:class, 'create-tint-check-name').click
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @@driver.find_element(:css, '.pull-left').displayed?}
    return UserAccountPage.new(@@driver)
  end


  def no_goal
    @@driver.find_element(:css, '.create-tint-activate-no').click
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { @@driver.find_element(:class, 'question-text').displayed?}
    return UserAccountPage.new(@@driver)
  end

  def no_analytics
    @@driver.find_element(:css, '.create-tint-activate-no').click
    # wait = Selenium::WebDriver::Wait.new(timeout: 5)
    # wait.until { @@driver.find_element(:class, 'question-text').displayed?}
    return TintPage.new(@@driver)
  end

  def dashboard_dropdown_toggle
    @@driver.find_element(:id, 'dashboards_dropdown_toggle').click
    return UserAccountPage.new(@@driver)
  end

  def dashboard_dropdown
    @@driver.find_element(:xpath, '//a[contains(text(),"Collaborators")]').click
    return CollaboratorsPage.new(@@driver)

  end

end