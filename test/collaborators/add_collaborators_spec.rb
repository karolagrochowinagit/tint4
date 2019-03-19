require 'rspec'
require 'selenium-webdriver'
require_relative '../../main/pages/abstract_page'
require_relative '../../main/pages/home_page'
require_relative '../../main/pages/log_in_page'
require_relative '../../main/pages/user_account_page'
require_relative '../../main/pages/tint_page'
require_relative '../../main/pages/collaborators_page'

describe 'new collaborators' do

  app3 = nil

  before(:each) do
    app3 = HomePage.new(Selenium::WebDriver.for (:chrome))
  end

  it 'should add new collaborators' do

    page3=app3
        .go_to_home_page
        .click_on_login
        .user_email('')
        .user_password('')
        .user_remember
        .user_submit
        .dashboard_dropdown_toggle
        .dashboard_dropdown
        .add_collaborator
          .collaborator_email('emailtestowy123+5@gmal.com')
        .all_permissions
        .permissions_submit
        .collaborator_tint_list
        .collaborator_checkbox
        .collaborator_send

    expect('emailtestowy123+5@gmal.com').to be == page3.added_collaborator

  end

  after(:each) do
    app3.close_browser
  end

end