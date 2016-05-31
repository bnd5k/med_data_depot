Feature: Guidelines
  As an consumer of medical data
  I want data to be readily available
  So that doctors can access it easily

  Scenario: User retrieves a list of guidelines

  Scenario: User retrieves a guideline

  Scenario: Importing a guideline
    Given an incomplete guideline
    When I import the recommendation
    Then the guideline contains data for the recommendation
