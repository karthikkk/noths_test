Given(/^I am on the Grapevine Gift Crate product selection page$/) do
  visit_page GrapevineGratePage
  on_page GrapevineGratePage do |page|
    page.handle_geo_popup
  end
end

When(/^I fill in the desired delivery date field$/) do
  on_page GrapevineGratePage do |page|
    page.enter_desired_delivery_date
  end
end
When(/^I select the additional extras to none$/) do
  on_page GrapevineGratePage do |page|
    page.select_additional_extras
  end
end
When(/^I click add to basket$/) do
  on_page GrapevineGratePage do |page|
    page.click_add_to_basket
  end
end

When(/^I do not fill in (.*)$/) do |mandatory_fields|
  @mandatory_fields = mandatory_fields
end

Then(/^I should see validation error '(.*)'$/) do |validation_error|
  case @mandatory_fields
    when 'desired delivery date'
      on_page GrapevineGratePage do |page|
        page.check_desired_date_validation(validation_error)
      end
    when 'additional extras'
      on_page GrapevineGratePage do |page|
        page.additional_extras_validation(validation_error)
      end
  end

end
Then(/^I should be on the products page$/) do
  on_page GrapevineGratePage do |page|
    page.check_page_title
  end

end