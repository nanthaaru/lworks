And(/^user select "([^"]*)" for "([^"]*)"$/) do |value, label|
  form_fill(label,value)
end