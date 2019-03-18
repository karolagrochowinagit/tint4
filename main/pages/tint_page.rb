require_relative '../../../src/main/pages/abstract_page'

class TintPage < AbstractPage

  def initialize(driver)
    super (driver)
  end

  def go_to_edit_tint
    @@driver.navigate.to "https://www.tintup.com/t/nowyautomatycznytint8/edit/moderate/all"
    return TintPage.new(@@driver)
  end

  def tumb_icon
    @@driver.find_element(:css, '.tb > .fab').click
    return TintPage.new(@@driver)
  end

  def hastag_connection
    @@driver.find_element(:css, '.advanced-feed-type-tabedit-content-tb-modal-li-hashtags > a').click
    return TintPage.new(@@driver)
  end

  def hastag_text(hastag)
    @@driver.find_element(:css, '.edit-content-tb-modal-connect-hash-input').send_keys hastag
    return TintPage.new(@@driver)
  end

  def submit_connection
    @@driver.find_element(:css, '.edit-content-tb-modal-hashtag-moderate-label').click
    return TintPage.new(@@driver)
  end

end