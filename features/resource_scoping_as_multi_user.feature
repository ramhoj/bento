Feature: Account scooping with a user that belongs to several accounts
  In order to keep data private
  As a user of the application
  I want to users to only see things that belongs to their account

  Background:
   Given there is an account "Elabs"
   And there is an account "IKEA"
   And there is an account "SEB"
   And the account "Elabs" has the project "Serenity"
   And the account "IKEA" has the project "Expedit"
   And the account "SEB" has the project "Fort Nox"
   And there is a user "antony@elabs.se" belonging to the accounts "Elabs" and "SEB"
   And I am signed in as "antony@elabs.se"

  Scenario: Viewing projects in my account
    When I follow "My projects"
    Then I should see "Serenity"
    And I should see "Fort Nox"
    And I should not see "Expedit"

  Scenario: Viewing my account
    When I follow "My accounts"
    Then I should see "Elabs"
    And I should see "SEB"
    And I should not see "IKEA"
