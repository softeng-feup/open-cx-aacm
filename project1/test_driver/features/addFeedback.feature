Feature: Add feedback

Scenario: user wants to give feedback about a lecture
	Given The user has selected a lecture
	When The user selects Feedback
	And The user selects the 'Give us your feedback button'
	Then the user rates and writes a comment about the talk
