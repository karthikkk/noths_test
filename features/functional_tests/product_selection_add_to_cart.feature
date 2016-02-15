Feature: Run a smoke test to make sure Grapevine page is available

  @smoke
  Scenario: Smoke
    Given I am on the products page
    Then I should be on the products page