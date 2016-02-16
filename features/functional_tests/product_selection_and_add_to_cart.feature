Feature: As a Not On The High Street Customer, I can visit the Grapevine Gift Crate page So that I can purchase them

  Background:
    Given I am on the Grapevine Gift Crate product selection page
    Then I should be on the products page

#happy path, just adding one item
  Scenario: Go to product page
    When I fill in the desired delivery date field
    And I select the additional extras to none
    When I click add to basket
    Then I should be on the shopping cart page
    And I should see the item I have selected

#    Scenario: Validate product details
#      When I am on the products page
#      Then I should see the product name
#      And should see the manufacturer details
#      And I should the the price
#      And I should see the stock details
#      And I should the customer reviews
#
#  Scenario: Check product image layout
#    When I click on product image thumbnails
#    Then I should see the various images
#
#    Scenario: check product tabs
#      When I click on product details tabs
#      Then I should see all the expected product details
#      And when I click on customer review tab
#      Then I should see customer reviews with ratings
#      When I click delivery tab
#      Then I should see delivery details and options
#      When I click Returns tab
#      Then I should see the expected Returns Policy
#
# Scenario: shopping cart validations
#   When I add Grapevine Gift Crate to the cart
#   Then I should see Grapevine Gift Crate product in the cart
#   And the quantity should be 1
#   And I should see continue shopping button
#   And I should see checkout button

#   Scenario: Remove and item from the shopping cart
#   When I add Grapevine Gift Crate to the cart
#   Then I should see Grapevine Gift Crate product in the cart
#    when I click checkout button
#     Then I should be on the checkout page
#     when I remove the item Grapevine Gift Crate item
#     Then the item disappears from the shopping cart
