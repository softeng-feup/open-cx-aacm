Feature: Add resource

Scenario: user wants to add a resource about a lecture
	Given The user has selected a lecture
	When The user selects Resources
	And The user selects the 'Add resource'
	Then the user selects files to add about the lecture
