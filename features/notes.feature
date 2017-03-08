Feature: notes

  Scenario: Create a note
    Given I send and accept JSON
    And that I am logged in as a user
    When I send a request to create a note
    Then the response status should be "201"
    And the response should be the note

  Scenario: Get user notes
    Given I send and accept JSON
    And that I am logged in as a user
    And I send a request to create a note
    And I send a request to create a note
    When I send a GET request to "/api/notes"
    Then the response status should be "200"
    And the JSON response should have "$..content" with a length of 2
    And the JSON response should have "$..title" with a length of 2

  Scenario: Update a note
    Given I send and accept JSON
    And that I am logged in as a user
    And I send a request to create a note
    When I send a request to update a note
    Then the response status should be "200"
    And the response should be the note
