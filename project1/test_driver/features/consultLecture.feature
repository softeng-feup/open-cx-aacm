Feature: Consult lectures' information

  Scenario: user wants to consult a lecture
    Given The user is logged in
    When The user wants to consult a lecture
    Then The user presses that lecture's button