Feature: Manage users
  In order have users on accounts
  As an admin
  I want to create users

  Background:
    Given I am logged in as admin
    And I am on the home page
    And there is an account "Elabs"
    And there is a user "olduser@elabs.se" belonging to the account "Elabs"
    And I follow "Manage accounts"
    And I follow "Elabs"

  Scenario: Successfully creating a user
    When I follow "Add user"
    And I fill in "Email" with "newuser@elabs.se"
    And I fill in "Password" with "test1234"
    And I fill in "Password confirmation" with "test1234"
    And I press "Create User"
    Then I should see "User was successfully created"
    And I should see "newuser@elabs.se"

  Scenario: Unsuccessfully creating a user
    When I follow "Add user"
    And I fill in "Email" with ""
    And I press "Create"
    And the "Email" field should have the error message "can't be blank"
    And the "Password" field should have the error message "can't be blank"
    And I should see the header "New user"

  Scenario: Successfully edit a user
    When I follow "Edit 'olduser@elabs.se'"
    And I fill in "Email" with "anders@elabs.se"
    And I press "Update"
    Then I should see "User was successfully updated"
    And I should not see "newuser@elabs.se"
    And I should see "anders@elabs.se"

  Scenario: Unsuccessfully edit a user
    When I follow "Edit 'olduser@elabs.se'"
    And I fill in "Email" with ""
    And I press "Update"
    And the "Email" field should have the error message "can't be blank"
    And I should see the header "Edit user"
    When I follow "Back"
    Then I should see "olduser@elabs.se"

  Scenario: Deleting a user
    When I press "Delete 'olduser@elabs.se'"
    Then I should see "User was successfully destroyed"
    And I should see the header "Elabs"
    And I should see the header "Users"
    And I should not see "olduser@elabs.see"
