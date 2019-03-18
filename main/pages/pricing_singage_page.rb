
require_relative '../../../src/main/pages/abstract_page'
require_relative '../../../src/main/pages/checkout_singage_page'


class PricingSingagePage <AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_pricing_singage_page
    @@driver.navigate.to "https://www.tintup.com/pricing/signage"
    return PricingSingagePage.new(@@driver)
  end



  def monthly_toggle
    @@driver.find_element(:css, '.option:nth-child(2)').click
    return PricingSingagePage.new(@@driver)
  end

  def select_inform_plan
    @@driver.find_element(:xpath, '//a/button').click
    return CheckoutSingagePage.new(@@driver)
  end



end
