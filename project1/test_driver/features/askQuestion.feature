Feature: Ask questions

  Scenario: user wants to ask a question about a lecture
    Given The user has selected a lecture
    When The user selects the Questions´ Forum 
    And The user selects the 'Ask Question' button
    Then The user writes the question details

