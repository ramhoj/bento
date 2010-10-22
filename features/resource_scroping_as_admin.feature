Feature: Browse scoped resources
  In order work with accounts
  As a admin
  I want admins to be able to traverse across resources that belongs to different accounts

  Scenario: An admin goes to a different account
    Given I am logged in as admin
    And I am on the home page
    And there is an account "Elabs"
    And there is an account "Hashrocket"
    And there is a project called "Serenity" belonging to the account "Elabs"
    And there is a project called "Hydra" belonging to the account "Hashrocket"
    When I follow "All projects"
    And I follow "Hydra"
    Then I should see the header "Hydra"
    When I follow "All projects"
    And I follow "Serenity"
    Then I should see the header "Serenity"