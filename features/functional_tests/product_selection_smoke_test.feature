Feature: As a Not On The High Street Customer, I can visit the products page So that I can purchase them

  Background:
    Given I am on the products page

  Scenario: Go to product page
  When I fill in the desired delivery date field
  And I select the additional extras to none
  When I click add to basket
  Then I should be on the shopping cart page
  And I should see the item I have selected

