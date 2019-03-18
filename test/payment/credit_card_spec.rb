require 'rspec'
require 'rspec/expectations'
require 'selenium-webdriver'
require_relative '../../../src/main/pages/home_page'
require_relative '../../../src/main/pages/log_in_page'
require_relative '../../../src/main/pages/abstract_page'
require_relative '../../../src/main/pages/user_account_page'
require_relative '../../../src/main/pages/payment_page'
require_relative '../../../src/main/pages/pricing_page'
require_relative '../../../src/main/pages/pricing_singage_page'
require_relative '../../../src/main/pages/checkout_singage_page'

describe 'go to payment and use voucher' do

  app = nil

  before(:each) do
    app = HomePage.new(Selenium::WebDriver.for (:chrome))
  end

  it 'should declined voucher' do

      app
          .go_to_home_page
          .click_on_login
            .user_email('karolagrochowina@gmail.com')
            .user_password('Karola22')
            .user_remember
            .user_submit
          .user_account_details
          .payment_dropdown
          .go_to_payment_page
          .change_plan
          .go_to_pricing_page
          .choose_signage_plan
          .monthly_toggle
          .select_inform_plan
          .monthly_inform_plan
          .coupon('212324')
          .apply_coupon

   expect('Invalid Promo Code').to coupon_error_msg

  end

  after(:each) do
    app.close_browser
  end

end