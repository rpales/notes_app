Feature: users

  Scenario: Create user
    Given I send and accept JSON
    When I send a request to create an user
    Then the response status should be "201"
    And the response should be the user

  Scenario: Create user without all needed parameters
    Given I send and accept JSON
    When I send a request to create an user with missing parameters
    Then the response status should be "422"

  Scenario: Create existing user session
    Given I send and accept JSON
    When I send a request to create an user
    When I send a request to create a session
    Then the response status should be "201"
    And the response should be the user

  Scenario: Create existing user session without all needed parameters
    Given I send and accept JSON
    When I send a request to create a session with missing parameters
    Then the response status should be "422"
