class ShoppingCartPage
  include PageObject

  def check_shopping_cart_popup
    expected_shopping_cart_header ='item added to basket'
    @browser.h2(:class, 'left').wait_until_present
    @browser.h2(:class, 'left').text.should == expected_shopping_cart_header
  end

  def check_shopping_cart_item
    @browser.h3(:class, 'left').wait_until_present
    expected_product_selection = 'Grapevine Gift Crate'
    @browser.div(:id, 'item_added').h3(:class, 'left').text.should == expected_product_selection
  end

  def check_shopping_cart_quantity
    @browser.span(:class, 'quantity').text.should == 'Qty: 1'
  end

end