Then(/^I should be on the shopping cart page$/) do
  on_page ShoppingCartPage do |page|
    page.check_shopping_cart_popup
  end

end

When(/^I should see the item I have selected$/) do
  on_page ShoppingCartPage do |page|
    page.check_shopping_cart_item
    page.check_shopping_cart_quantity
  end
end

