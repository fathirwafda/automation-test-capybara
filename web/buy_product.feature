@purchase-product
Feature: Buy a product on SauceDemo.com

  Scenario: Buy a product
    Given I visit to SauceDemo website
    When I log in with valid credentials
    Then I should be logged in
    When I sort products by highest price
    Then products should be sorted by highest price
    When I click on the first product
    And I proceed to checkout
    And complete the purchase on the checkout
    Then I should see the order confirmation
