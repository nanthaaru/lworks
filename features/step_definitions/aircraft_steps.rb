require 'spreadsheet'
require 'pry'
require 'gmail'

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open File.expand_path('../../support/data.xls', __FILE__)

Given(/^user logins and navigates to home page$/) do
  visit '/'
  page.fill_in 'username', :with => 'nantha.qa@lw.com'
  page.fill_in 'password', :with => 'lworks123'
  page.click_button 'Login'
  if page.find('input', :text => "Email me a verification code" ) != nil
    page.click_button 'save'
    sleep 15
    verification_code = reademail
    page.fill_in 'code',verification_code
    page.click_button 'save'
  end
  page.click_link 'Home'
end

def get_id_from_label(table)
  table.hashes.each do |row|
    row.each do |key,value|
      p key
      label = page.find("label", :text => key)
      p label[:for]
      p label[:id]
    end
  end
end

def form_fill(field_name, value)
  # p field_name
  # p value
  label = page.find('label', :text => field_name, :exact => true, :match => :first)
  # document.getElementById("00Nd00000075Q7c").parentNode.className
  # document.getElementById("00Nd0000007eY4A").parentNode.className
  element_id = label[:for]
  if field_name != 'Owner'
  if page.find_by_id(element_id).tag_name == 'select'
    # p page.find_by_id(element_id).class
    # option = first(element_id).text
    # select option, :from => element_id
    page.select value, :from => element_id
  else
    if page.find_by_id(element_id).tag_name == 'input'
      if page.find_by_id(element_id)[:type] == 'text'
        if page.find_by_id(element_id).class == 'dateInput'
          page.fill_in element_id, :with => value
        else
            page.fill_in element_id, :with => value
        end
      else
        if page.find_by_id(element_id)[:type] == 'checkbox'
          # p page.find_by_id(element_id).class
          # page.fill_in element_id, :with => value
        end
    end

  end
  end
    end
end

def get_label_from_page
  # visit "/"
lables = page.all("label", :text => "")
lables.each do |label|
   p label.text
  # form_fill(label.text,('a'..'z').to_a.shuffle[0,8].join)
end
end

When(/^user fill\-in "([^"]*)" information from datasheet/) do |screen|
  work_sheet = book.worksheet screen
  work_sheet.drop(1).each do |row|
    field_name = row[3]
    field_value = row[4]
    # p field_name
    # p field_value
    if field_value != nil
      form_fill(field_name, field_value)
    end
  end
end

When(/^user fill\-in "([^"]*)" information from regression/) do |screen|
  work_sheet = book.worksheet 'Regression'
  colindex = work_sheet.row(0).index(screen)
  work_sheet.drop(1).each do |row|
    field_name = row[colindex]
    field_value = row[colindex+1]
    # p field_name
    # p field_value
    break if field_name == nil
    if field_value != nil
      form_fill(field_name, field_value)
    end
  end
end

And(/^user clicks on "([^"]*)" button$/) do |btn_name|
  click_button(btn_name,:match => :first)
  sleep 2
#   get_label_from_page
if btn_name == "New Monthly Utilization"
  sleep 60
# # #   # get_label_from_page
# # # #   # p "---------------"
end
  end

Then(/^verify that newly added records is displayed$/) do |table|
  header = page.all('table.list tr.headerRow th').map(&:text)
  datarow = page.all('table.list tr.dataRow')
  table.hashes.zip(datarow).each do |row,data|
    row.each do |key,value|
      header.should include(key)
      data.text.should include(value)
    end
  end
end

When(/^user navigates to "([^"]*)" tab$/) do |tab_name|
  click_link(tab_name, :match => :first)
  # sleep 30
  # get_label_from_page
  # sleep 30
end

And(/^accept browser pop\-up$/) do
  page.driver.browser.switch_to.alert.accept
end

And(/^user selects newly added "([^"]*)"/) do |aircraft_name|
 p aircraft_name
  click_link(aircraft_name, :exact => true, :match => :first)
  # sleep 15
end

Then(/^Verify that aircraft "([^"]*)" is deleted$/) do |aircraft_name|
  datarow = page.all('table.list tr.first .dataCell').map(&:text)
  datarow.should_not include(aircraft_name)
end

And(/^user fill\-in aircraft "([^"]*)" section$/) do |arg, table|
  # table is a table.hashes.keys # => [:Line #, :Number Of Landing Gears]
  table.hashes.each do |row|
    row.each do |key,value|
      form_fill(key,value)
    end
  end
end

Then(/^verify that Aircraft status is changed to assigned$/) do |table|
  step "verify that newly added records is displayed", table
end


Then(/^verify that Assembly Utilizations are auto created$/) do |table|
  step "verify that newly added records is displayed", table
end

Then(/^verify that "([^"]*)" are/) do |arg, table|
  table.hashes.each do |row|
    row.each do |key,value|
      elements = page.all('td.labelCol', text: key)
      # binding.pry
      if elements.count > 1
        elements.each do |element|
          if element.text == key
            elements = element
            break
          end
        end
      else
        elements = elements.first
      end
      if elements.find(:xpath,"../td[1]").text == key
        actual = elements.find(:xpath,"../td[2]").text
      else
        actual = elements.find(:xpath,"../td[4]").text
      end
      actual.should include(value)
    end
  end
end

And(/^user selects assembly utilization "([^"]*)"$/) do |item_type|
  element = page.find('td.dataCell', :text => item_type,:match => :first )
  page.click_link element.find(:xpath,"../th").text
end

Then(/^verify following error message is displayed "([^"]*)"$/) do |error_msg|
  page.find('.pbError').text.should include(error_msg)
end

def reademail()
  gmail = Gmail.connect('nanthalw', 'lworks123')
  # binding.pry
  string_index = gmail.inbox.emails(:unread, :from => "support@salesforce.com")[0].message.raw_source.index('Verification Code:')
  verification_code = gmail.inbox.emails(:unread, :from => "support@salesforce.com")[0].message.raw_source[string_index+19, string_index+24]
end