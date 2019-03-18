require_relative '../../../src/main/pages/abstract_page'
require_relative '../../../src/main/pages/pricing_singage_page'

class PricingPage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_pricing_page
    @@driver.navigate.to "https://www.tintup.com/pricing/"
    return PricingPage.new(@@driver)
  end

  def choose_signage_plan
    @@driver.find_element(:xpath, '//div[2]/a/button').click
    return PricingSingagePage.new(@@driver)
  end


end