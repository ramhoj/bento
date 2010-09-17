Feature: A visitor signs up for an account
  In order to start using the web application
  As a visitor to the web application
  I want to sign up and start using the app

  Background:
    Given I am on the sign up page

  Scenario: Successfully creating a new account
    And I fill in "Account name" with "Elabs"
    And I fill in "First name" with "Jonas"
    And I fill in "Last name" with "Nicklas"
    And I fill in "Email address" with "nicklas@elabs.se"
    And I fill in "Password" with "test1234"
    And I fill in "Password confirmation" with "test1234"
    And I press "Create account"
    Then I should see "Account was successfully created."
    And I should see "Welcome nicklas@elabs.se"

  Scenario: Unsuccessfully creating a new account because the user details are incorrect
    When I follow "Sign up"
    And I fill in "Account name" with "Elabs"
    And I press "Create account"
    Then I should see form errors

  Scenario: Unsuccessfully creating a new account because the account details are incorrect
    When I follow "Sign up"
    And I fill in "First name" with "Jonas"
    And I fill in "Last name" with "Nicklas"
    And I fill in "Email address" with "nicklas@elabs.se"
    And I fill in "Password" with "test1234"
    And I fill in "Password confirmation" with "test1234"
    And I press "Create account"
    Then I should see form errors
    And I should see "Account name can't be blank"