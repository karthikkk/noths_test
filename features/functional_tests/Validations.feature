Feature: As a Not On The High Street Customer,
  I have to fill in the mandatory fields on the product selection page
  so that I can add products to the shopping cart

  #negative scenarios, when the customer does not fill in the mandatory text fields
  Scenario Outline: Mandatory fields validation
    Given I am on the Grapevine Gift Crate product selection page
    When I do not fill in <mandatory_fields>
    When I click add to basket
    Then I should see validation error 'Please enter a value'
  Examples:
    |mandatory_fields     |
    |desired delivery date|
    |additional extras    |


#    Scenario: Text field validations
#     Check for special characters and character limit on each text field