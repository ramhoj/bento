Feature: Account scooping
  In order to keep data private
  As a user of the application
  I want to users to only see things that belongs to their account

  Background:
   Given there is an account "Elabs"
   And there is a user "antony@elabs.se" belonging to the account "Elabs"
   And I am signed in as "antony@elabs.se"

  Scenario: Viewing projects in my account
    And the account "Elabs" has the project "Secret"
    When I follow "Projects"
    Then I should see "Secret"

  Scenario: Can't see projects not in my account
    And the account "Elabs" has the project "Secret"
    And there is an account "Hashrocket"
    And the account "Hashrocket" has the project "Take over the world"
    When I follow "Projects"
    Then I should not see "Take over the world"
    And I should see "Secret"
