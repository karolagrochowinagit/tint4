require_relative './abstract_page'
require_relative './log_in_page'

class CollaboratorsPage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_collaborators_page
    @@driver.navigate.to "https://www.tintup.com/admin/collaborators"
    return CollaboratorsPage.new(@@driver)
  end

  def add_collaborator

    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.collaborator-add-btn').displayed?}
    @@driver.find_element(:css, '.collaborator-add-btn').click
    return CollaboratorsPage.new(@@driver)
  end

  def collaborator_email(collaborator)
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:id, 'enterprise_account_add_email').displayed?}
    @@driver.find_element(:id, 'enterprise_account_add_email').send_keys collaborator
    return CollaboratorsPage.new(@@driver)
  end

  def all_permissions
    @@driver.find_element(:xpath, '(//input[@type="checkbox"])[38]').click
    return CollaboratorsPage.new(@@driver)
  end

  def permissions_submit
    @@driver.find_element(:css, '.collaborator-account-submit').click
    return CollaboratorsPage.new(@@driver)
  end

  def collaborator_tint_list
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.collaborator-tint-list > thead label').displayed?}
    @@driver.find_element(:css, '.collaborator-tint-list > thead label').click
    return CollaboratorsPage.new(@@driver)
  end

  def collaborator_checkbox
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css,'.alert').displayed?}
    @@driver.find_element(:css,'.alert').click
    return CollaboratorsPage.new(@@driver)
  end

  def collaborator_send
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { @@driver.find_element(:css, '.collaborator-custom-field-send').displayed?}
    @@driver.find_element(:css, '.collaborator-custom-field-send').click
    sleep(15)
    return CollaboratorsPage.new(@@driver)
  end

  def added_collaborator
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @@driver.find_element(:xpath, './/label[contains(.,"emailtestowy123+5@gmal.com")]').displayed?}
    return @@driver.find_element(:xpath, './/label[contains(.,"emailtestowy123+5@gmal.com")]').text

  end

end