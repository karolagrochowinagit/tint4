require_relative '../../../src/main/pages/abstract_page'
require_relative '../../../src/main/pages/log_in_page'

class CollaboratorsPage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_collaborators_page
    @@driver.navigate.to "https://www.tintup.com/admin/collaborators"
    return CollaboratorsPage.new(@@driver)
  end

  def add_collaborator
    @@driver.find_element(:css, '.button.btn-rounded:nth-child(2)').click
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @@driver.find_element(:id, 'enterprise_account_add_email').displayed?}
    return CollaboratorsPage.new(@@driver)
  end

  def collaborator_email(collaborator)
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
    @@driver.find_element(:css, '.collaborator-tint-list > thead label').click
    return CollaboratorsPage.new(@@driver)
  end
  def collaborator_send
    @@driver.find_element(:css, '.collaborator-custom-field-send').click
    return CollaboratorsPage.new(@@driver)
  end

end