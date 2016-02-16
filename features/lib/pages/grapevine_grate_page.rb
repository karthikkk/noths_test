class GrapevineGratePage

  include PageObject

  page_url 'http://www.notonthehighstreet.com/thegluttonousgardener/product/mini-vineyard'

  def handle_geo_popup
    if @browser.element(:id, 'geo_popup').exists?  #as I am hitting the site from outside UK, I am getting a geo popup to set the country and currency
      @browser.link(:title, 'Close').when_present.click
      puts "closed geo pop-up message"
    else
      puts "No geo pop-up message to close"
    end
  end

  def check_page_title
    expected_title = "grapevine gift crate by the gluttonous gardener | notonthehighstreet.com"
    @browser.title.should == expected_title
  end

  def enter_desired_delivery_date
    @browser.text_field(:class, 'customer_defined_option input required').when_present.set('11-03-2016')
  end

  def select_additional_extras
    locale = @browser.link(:href, '/geo').when_present.text #As the sauce lab servers are in the US, I am identifying the currency locale and pass it onto the element identifier below.
    currency = locale[2..-1]  #strip out £ and $ from  £ GBP and $ USD string to pass in the next step
    @browser.select_list(:id, 'line_item_options_attributes_4_product_option_value_id_currency_'+"#{currency}").select('None')
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