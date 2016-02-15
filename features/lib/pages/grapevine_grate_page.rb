require 'rspec/matchers'
class GrapevineGratePage
  include PageObject

  page_url 'http://www.notonthehighstreet.com/thegluttonousgardener/product/mini-vineyard'

  def handle_geo_popup
    if @browser.element(:id, 'geo_popup').exists?
      @browser.link(:title, 'Close').when_present.click
      puts "closed geo pop-up message"
    else
      puts "No geo pop-up message to close"
    end
  end

  def check_page_title
    expected_title = "grapevine gift crate by the gluttonous gardener | notonthehighstreet.com"
    #expect(@browser.title).to eq(expected_title)
    @browser.title.should == expected_title
  end

  def enter_desired_delivery_date
    @browser.text_field(:id, 'desired_delivery_date_monday_-_friday_only_fcc7eeb8483522e09bd1bc61f845dc6f2e7c8649').when_present.set('11-03-2016')
  end

   def select_additional_extras
     @browser.select_list(:id, 'line_item_options_attributes_4_product_option_value_id_currency_GBP').select('None')
   end

  def click_add_to_basket
    @browser.button(:id, 'add_to_cart').when_present.click
  end

  def check_desired_date_validation(validation_error)
    @browser.span(:class, 'error inline-errors last').text.should == validation_error
  end

  def additional_extras_validation(validation_error)
    @browser.span(:class, 'error inline-errors last').text.should == validation_error
  end

end