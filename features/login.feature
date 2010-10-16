Feature: Current account
  In order to provide a way to access the currently logged in user's account
  I want to provide a rails helper that returns the currently logged in user

  Background:
    Given there is an account "Elabs"
    And there is a user "antony@elabs.se" belonging to the account "Elabs"
    And I am on the homepage
    And I am signed in as "antony@elabs.se"

  Scenario: See the name of the current account
    Then I should see "Current account: Elabs"