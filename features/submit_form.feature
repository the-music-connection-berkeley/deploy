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
  And I select "6 month" from "Experiences"
  And I select "Monday" from "Time Availability"
  And I press "Next"
  Then I should see "In Class"
  When I choose "InClass_Yes"
  And I select "Cello" from "Instrument"
  And I check "Grade 3~5"
  And I choose "Private_Yes"
  Then I should see "Piano or Vocal?"
  When I check "Piano"
  And I check "Grade 3~5p"
  And I press "Next"
  Then I should see "Member Commitment Policy"
  And I should see "Attendance Policy"
  When I check "Member Commitment Policy"
  And I check "Attendance Policy"
  And I press "Next"
  Then I should see "Returning or New"
  When I choose "Returning"
  And I press "Next"
  Then I should see "Prefer to work with previous student or class?"
  When I choose "Prefer_Yes"
  And I fill in "Preferred Student" with "John"
  And I press "Submit"
