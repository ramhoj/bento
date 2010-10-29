Feature: Manage accounts
  In order to keep data private
  As an admin
  I want to create accounts

  Background:
    Given I am logged in as admin
    And I am on the home page

  Scenario: Successfully creating a new account
    Given I follow "Manage accounts"
    When I follow "Add account"
    And I fill in "Name" with "Elabs"
    And I press "Create"
    Then I should see "Account was successfully created"
    And I should see the header "Elabs"
    When I follow "Back to accounts"
    And I should see "Elabs"

  Scenario: Unsuccessfully creating a new account
    Given I follow "Manage accounts"
    When I follow "Add account"
    And I press "Create"
    And the "Name" field should have the error message "can't be blank"
    And I should see the header "New account"

  Scenario: Successfully updating an account
    Given there is an account "Elbbs"
    And I follow "Manage accounts"
    When I follow "Edit 'Elbbs'"
    And I fill in "Name" with "Elabs"
    And I press "Update"
    Then I should see "Account was successfully updated"
    And I should see the header "Elabs"
    When I follow "Back to accounts"
    Then I should see "Elabs"
    And I should not see "Elbbs"

  Scenario: Unsuccessfully updating an account
    Given there is an account "Elbbs"
    And I follow "Manage accounts"
    When I follow "Edit 'Elbbs'"
    And I fill in "Name" with ""
    And I press "Update"
    And the "Name" field should have the error message "can't be blank"
    And I should see the header "Edit account"
    When I follow "Back to accounts"
    Then I should see "Elbbs"
    And I should not see "Elabs"

  Scenario: Deleting an account
    Given there is an account "Elabs"
    And I follow "Manage accounts"
    When I press "Delete 'Elabs'"
    Then I should see "Account was successfully destroyed"
    And I should see the header "Accounts"
    And I should not see "Elabs"

  Scenario: Signed out users can't access the accounts list
    Given I follow "Sign out"
    When I go to the accounts page
    Then I should see "You need to sign in or sign up before continuing"

  Scenario: Users who don't respond to admin? can access the accounts list
    Given users don't respond to admin?
    When I go to the accounts page
    Then I should see the header "Accounts"

  Scenario: Users who respond with true to admin? can access the accounts list
    Then users show respond true to admin? should see "Accounts"

  Scenario: Users who respond with false to admin? can access the accounts list
    Then users show respond false to admin? should see "You are not authorized to access this page."

  Scenario: Creating a new account using the site model with overridden after creation redirect
    When I follow "Manage custom accounts"
    Then I should see the header "Custom accounts"
    When I follow "Add account"
    And I fill in "Name" with "Elabs"
    And I press "Create"
    Then I should see "Site was successfully created"
    And I should see the header "Elabs (Custom account)"
    And I should not see the header "Accounts"