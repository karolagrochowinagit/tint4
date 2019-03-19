require 'rspec'
require'selenium-webdriver'
require_relative '../../main/pages/abstract_page'
require_relative '../../main/pages/home_page'
require_relative '../../main/pages/log_in_page'
require_relative '../../main/pages/user_account_page'
require_relative '../../main/pages/tint_page'

describe 'create new tint' do

  app2 = nil

  before(:each) do
    app2 = HomePage.new(Selenium::WebDriver.for (:chrome))
  end

  it 'should add new tint - tumblr' do

      page2 = app2
          .go_to_home_page
          .click_on_login
            .user_email('')
            .user_password('')
            .user_remember
            .user_submit
          .add_tint
            .tint_username('NowyAutomatycznyTint8')
            .tint_username_submit
            .no_goal
            .no_analytics
          .tumb_icon
          .hastag_connection
          .hastag_text('pictureoftheday')
          .submit_connection

      expect('#pictureoftheday').to be == page2.added_connection

  end

    after(:each) do
      app2.close_browser
    end

end