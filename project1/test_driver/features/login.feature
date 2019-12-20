  
Feature: LogIn

  Scenario: User wants to enter the app
    Given The user writes an email
    And The user writes a password
    When The user presses the Login button
    Then The user is logged in

