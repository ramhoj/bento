Feature: Account scooping
  In order to keep data private
  As a user of the application
  I want to users to only see things that belongs to their account

  Background:
   Given there is an account "Elabs"
   And there is a user "antony@elabs.se" belonging to the account "Elabs"
   And I am signed in as "antony@elabs.se"

  Scenario: Trying to view a project in another account
    Given there is an account "Hashrocket"
    And there is a project called "Hydra" belonging to the account "Hashrocket"
    When I follow "All projects"
    When I follow "Hydra" I expect an active record not found exception

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

  Scenario: Trying to create a project on another account just creates it on my own
    Given there is an account "Hashrocket"
    And there is a user "antony@hashrocket.se" belonging to the account "Hashrocket"
    When I follow "Projects"
    And I follow "Add project"
    And I fill in "Name" with "Github"
    And I fill in "Account" with the id of "Hashrocket"
    And I press "Create"
    Then I should see "Project was successfully created"
    And I should see "Github"

    When I follow "Sign out"
    And I am signed in as "antony@hashrocket.se"
    And I follow "Projects"
    Then I should not see "Github"

  Scenario: Can update a project on my account, but not on others
    And there is a project called "Flowers" belonging to the account "Elabs"
    When I follow "Projects"
    And I follow "Edit 'Flowers'"
    And I fill in "Name" with "Rockets"
    And I press "Update"
    Then I should see "Project was successfully updated"
    And I should not see "Flowers"
    And I should see "Rockets"

  Scenario: Can't update a projects on others accounts
    Given there is an account "Hashrocket"
    And there is a user "antony@hashrocket.se" belonging to the account "Hashrocket"
    And there is a project called "Rockets" belonging to the account "Hashrocket"
    When I follow "All projects"
    And I follow "Edit 'Rockets'"
    And I fill in "Name" with "Flowers"
    When I press "Update" I expect an active record not found exception

  Scenario: Can delete a project belonging to my account
    And there is a project called "Rockets" belonging to the account "Elabs"
    When I follow "Projects"
    And I press "Delete 'Rockets'"
    Then I should see "Project was successfully destroyed"
    And I should not see "Rockets"

  Scenario: Can't delete a project that belongs to some other account
    Given there is an account "Hashrocket"
    And there is a user "antony@hashrocket.se" belonging to the account "Hashrocket"
    And there is a project called "Rockets" belonging to the account "Hashrocket"
    And I follow "All projects"
    When I press "Delete 'Rockets'" I expect an active record not found exception