And(/^user select "([^"]*)" for "([^"]*)"$/) do |value, label|
  label_element = page.find('label', :text => label, :exact => true, :match => :first)
  form_fill(label,value,label_element[:for])
end