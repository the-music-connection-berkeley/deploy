When(/^I fill the form with:$/) do | table |
  datas = table.hashes.first
  datas.each do |label, value|
    fill_in(label, :with => value)
  end
end

Then /^check to see if correct/ do
  save_and_open_page
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  case field


  when /^Email/
    field = "question[email]"
  when /^Name/
    field = "question[name]"
  when /^SID/
    field = "question[sid]"
  when /^Phone Number/
    field = "question[phone]"
  when /^Year/
    field = "question[year]"
  when /^Major/
    field = "question[major]"
  when /^Minor/
    field = "question[minor]"
  when /^Experiences/
    field = "question[exp]"
  end

  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  case field

  when /^Name/
    field = "question[name]"
  when /^Email/
    field = "question[email]"
  when /^Name/
    field = "question[name]"
  when /^SID/
    field = "question[sid]"
  when /^Phone Number/
    field = "question[phone]"
  when /^Year/
    field = "question[year]"
  when /^Major/
    field = "question[major]"
  when /^Minor/
    field = "question[minor]"
  when /^Experiences/
    field = "question[exp]"
  end

  fill_in(field, :with => value)
end
