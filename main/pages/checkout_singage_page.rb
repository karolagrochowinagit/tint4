
require_relative './abstract_page'

class CheckoutSingagePage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_checkout_singage_page
    @@driver.navigate.to "https://www.tintup.com/checkout/signage_starter_plan"
    return CheckoutSingagePage.new(@@driver)
  end

  def monthly_inform_plan
    @@driver.find_element(:css, '.monthly').click
    return CheckoutSingagePage.new(@@driver)
  end

  def coupon(coupon)
    @@driver.find_element(:xpath, '//input[@value=""]').send_keys coupon
    return CheckoutSingagePage.new(@@driver)
  end

  def apply_coupon
    @@driver.find_element(:css, '.apply').click
    return CheckoutSingagePage.new(@@driver)
  end

  def coupon_error_msg
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @@driver.find_element(:css, '.coupon-msg').displayed?}
    return @@driver.find_element(:css, '.coupon-msg').text

  end
end