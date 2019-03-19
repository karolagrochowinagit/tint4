require_relative './abstract_page'
require_relative './pricing_page'

class PaymentPage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_payment_page
    @@driver.navigate.to "https://www.tintup.com/admin/payment"
    return PaymentPage.new(@@driver)
  end

  def change_plan
    @@driver.find_element(:css, '.pull-right > .refresh').click
    return PricingPage.new(@@driver)
  end


end