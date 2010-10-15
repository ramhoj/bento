Feature: A visitor signs up for an account
  In order to start using the web application
  As a visitor to the web application
  I want to sign up and start using the app

  Background:
    Given I am on the home page
    And I follow "Sign up"

  Scenario: Successfully creating a new account
    Then I should not see "Welcome to 'custom_accounts' controller!"
    When I fill in "Account name" with "Elabs"
    And I fill in "First name" with "Jonas"
    And I fill in "Last name" with "Nicklas"
    And I fill in "Email address" with "nicklas@elabs.se"
    And I fill in "Password" with "test1234"
    And I fill in "Password confirmation" with "test1234"
    And I press "Create account"
    Then I should see "Account was successfully created."

  Scenario: Unsuccessfully creating a new account because the account details are incorrect
    And I fill in "First name" with "Jonas"
    And I fill in "Last name" with "Nicklas"
    And I fill in "Email address" with "nicklas@elabs.se"
    And I fill in "Password" with "test1234"
    And I fill in "Password confirmation" with "test1234"
    And I press "Create account"
    And the "Account name" field should have the error message "can't be blank"

  Scenario: Using overridden controller with
    When I follow "Custom Accounts"
    Then I should see "Welcome to 'custom_accounts' controller!"

 Scenario: Seeing custom flash message in overridden controller
    When I follow "Custom Accounts"
    Then I should see "Welcome to 'custom_accounts' controller!"