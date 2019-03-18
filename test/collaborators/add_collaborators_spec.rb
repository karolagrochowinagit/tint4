require 'rspec'
require 'selenium-webdriver'
require_relative '../../../src/main/pages/abstract_page'
require_relative '../../../src/main/pages/home_page'
require_relative '../../../src/main/pages/log_in_page'
require_relative '../../../src/main/pages/user_account_page'
require_relative '../../../src/main/pages/tint_page'
require_relative '../../../src/main/pages/collaborators_page'

describe 'new collaborators' do

  app3 = nil

  before(:each) do
    app3 = HomePage.new(Selenium::WebDriver.for (:chrome))
  end

  it 'should add new collaborators' do

    app3
        .go_to_home_page
        .click_on_login
        .user_email('karolagrochowina@gmail.com')
        .user_password('Karola22')
        .user_remember
        .user_submit
        .dashboard_dropdown_toggle
        .dashboard_dropdown
        .add_collaborator
          .collaborator_email('emailtestowy@gmail.com')
        .all_permissions
        .permissions_submit
        .collaborator_tint_list
        .collaborator_send

  end

  after(:each) do
    app3.close_browser
  end

end