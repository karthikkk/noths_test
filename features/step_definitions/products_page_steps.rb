Given(/^I am on the products page$/) do
  visit_page GrapevineGratePage
  on_page GrapevineGratePage do |page|
    page.handle_geo_popup
  end
end

#Given(/^I am on the BA.com homepage$/) do
#  visit_page HomePage
#end
#When(/^I select my location and language$/) do
#  on_page HomePage do |page|
#    page.click_continue
#  end
#end
#Then(/^I am on the booking page$/) do
#  on_page ShoppingCartPage do |page|
#    page.check_page_title
#  end
#end
#
#module MobileFeed
#  def get_feed site
#    url = "http://goan.sky.com/vod/content/Home/content/applicationNavigation.do.xml"
#    uri = Addressable::URI.parse(url)
#
#    puts "url is #{uri}"
#
#    @response = HTTParty.get(uri)
#    p @response
#    Nokogiri::XML(@response.body)
#  end
#end
#
#World MobileFeed
#
#Given(/^I am on (.*) feed for top level navigation$/) do |site|
#  @xml_feed = get_feed site
#end
#
#Then /^The X-template should be correct for the title$/ do |table|
#  actual_feed = Array.new
#  @xml_feed.xpath('//NavItem').each do |node|
#    x_attr = node['xTemplate']
#    xml_title = node.children[1].text
#    actual_feed << {'title' => xml_title, 'x-template' => x_attr}
#  end
#
#  p "ACTUAL XML FEED", actual_feed
#  p "TABLE VALUES", table.hashes
#
#  #Raise error if actual_feed is empty or does not match the expected size
#  raise "The xml feed is empty!", "Expected size: " + table.hashes.size if actual_feed.size == 0
#  raise "The xml feed does not match expected size" if actual_feed.size != table.hashes.size
#
#  index = 0
#  table.hashes.each do |row|
#    feed_entry = actual_feed[index]
#    row['x-template'] = nil if row['x-template'] == "nil"
#
#    row['title'].should == feed_entry['title']
#    row['x-template'].should == feed_entry['x-template']
#    index +=1
#  end
#end
#
#When /^I should not see the (.*) node with x-template (.*) in the feed$/ do |title, x_template|
#  @xml_feed.xpath('//NavItem').each do |node|
#    node['xTemplate'].should_not == x_template
#    node.children[1].text.should_not == title
#  end
#end
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