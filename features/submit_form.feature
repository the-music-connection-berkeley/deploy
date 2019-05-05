Feature: Submit form

  As a tutor
  So that I can provide free music lessons
  I want to submit the application form

Scenario: Successfully submit tutor form
  Given I am on the tutor form
  When I fill in "Name" with "John"
  And I fill in "Email" with "johndoe@email.com"
  And I fill in "SID" with "1234567890"
  And I fill in "Phone Number" with "123-456-7890"
  And I fill in "Year" with "Senior"
  And I fill in "Major" with "Computer Science"
  And I fill in "Minor" with "Music"
