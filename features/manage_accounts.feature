Feature: Manage accounts
  In order to keep data private
  As an admin
  I want to create accounts

  Background:
    Given I am logged in as admin
    And I am on the home page
    And I follow "Mange accounts"

  Scenario: Successfully creating a new account
    When I follow "Add account"
    And I fill in "Name" with "Elabs"
    And I press "Create"
    Then I should see "Account was successfully created"
    And I should see the header "Accounts"
    And I should see "Elabs"

  @wip
  Scenario: Unsuccessfully creating a new account
    When I follow "Create account"
    And I press "Create"
    Then I should see the form error "can't be blank" on "Name"
    And I should see the header "Create account"
  # 
  # Scenario: Successfully updating an account
  #   Given there is an account "Elbbs"
  #   When I follow "Edit 'Elbbs'"
  #   And I fill in "Name" with "Elabs"
  #   And I press "Update"
  #   Then I should see "Account was successfully updated"
  #   And I should see the header "Accounts"
  #   And I should see "Elabs"
  #   And I should not see "Elbbs"
  # 
  # Scenario: Unsuccessfully updating an account
  #   Given there is an account "Elbbs"
  #   When I follow "Edit 'Elbbs'"
  #   And I fill in "Name" with ""
  #   And I press "Update"
  #   Then I should see the form error "can't be blank" on "Name"
  #   And I should see the header "Edit account"
  #   When I follow "Accounts"
  #   Then I should see "Elbbs"
  #   And I should not see "Elabs"
  # 
  # Scenario: Deleting an account
  #   Given there is an account "Elabs"
  #   When I press "Delete 'Elabs'"
  #   Then I should see "Account was successfully destroyed"
  #   And I should see the header "Accounts"
  #   And I should see "Elabs"
  # 
  # Scenario: Signed out users can't access the accounts list
  #   Given I follow "Sign out"
  #   When I go to the accounts page
  #   Then I should see "Please sign in before continue"
  # 
  # Scenario: Users who don't respond to admin? can access the accounts list
  #   Given I users don't respond to "admin?"
  #   When I go to the accounts page
  #   Then I should see the header "Accounts"
  # 
  # Scenario: Users who respond with true to admin? can access the accounts list
  #   Given I users don't respond to "admin?"
  #   When I go to the accounts page
  #   Then I should see the header "Accounts"
  # 
  # Scenario: Users who respond with false to admin? can access the accounts list
  #   Given I users don't respond to "admin?"
  #   When I go to the accounts page
  #   Then I should see "Please sign in before continue"
