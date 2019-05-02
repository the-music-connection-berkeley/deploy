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
  And I fill in "Experiences" with "Dead Musician's Society"
  And I press "Next"
  Then I should see "In Class"
  When I choose "InClass_Yes"
  Then I should see "Instrument"
  And I check "Cello"
  And I check "Mondays 2PM ~ 3PM"
  And I check "Grade 3~5"
  And I press "Next"
  Then I should see "Private Piano or Vocal?"
  When I choose "Private_Yes"
  Then I should see "Piano or Vocal?"
  When I check "Piano"
  And I check "Monday"


  And I check "Piano"


Scenario: Missing fields
  Given I am on the tutor form
  When I fill in "Name" with "TMC"
  And I press "Submit"
  Then I am on the tutor form
