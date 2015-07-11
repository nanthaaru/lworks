require 'spreadsheet'
require 'pry'
require 'gmail'

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open File.expand_path('../../support/data.xls', __FILE__)

Given(/^user logins and navigates to home page$/) do
  visit '/'
  page.driver.browser.manage.window.maximize
  page.fill_in 'username', :with => 'nantha.qa@lw.com'
  page.fill_in 'password', :with => 'lworks123'
  page.click_button 'Login'
  # if page.find(".verifyform" , :match => :first).exists?
  #   page.click_button 'save'
    # sleep 15
    # verification_code = reademail
    # page.fill_in 'code', :with => verification_code
    # page.click_button 'save'
  # end
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

def form_fill(field_name, value,element_id)
  # p element_id
  # binding.pry
  # p field_name
  # p value
  # label = page.find('label', :text => field_name, :exact => true, :match => :first)
  # document.getElementById("00Nd00000075Q7c").parentNode.className
  # document.getElementById("00Nd0000007eY4A").parentNode.className
  # element_id = label[:for]
  # p Time.now.utc.iso8601.gsub('-', '').gsub(':', '')
  # a = Time.new
  # p "%.6f" % a.to_f
  element = page.find_by_id(element_id)
  if field_name != 'Owner'
  if element.tag_name == 'select'
    # p page.find_by_id(element_id).class
    # option = first(element_id).text
    # select option, :from => element_id

    # element.select value, :from => element_id
    element.select value
  else
    if element.tag_name == 'input'
      if element[:type] == 'text'
        if element.class == 'dateInput'
          # element.fill_in element_id, :with => value
          element.set value
        else
          # element.fill_in element_id, :with => value
          element.set value
        end
      else
        if element[:type] == 'checkbox'
          element.click
          # p page.find_by_id(element_id).class
          # page.fill_in element_id, :with => value
        end
    end
  end
    if element.tag_name == 'textarea'
      # element.fill_in element_id, :with => value
      element.set value
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
      # form_fill(field_name, field_value)
    end
  end
end

When(/^user fill\-in "([^"]*)" information from regression/) do |screen|
  label_list = page.all('label', :text => '')
  element = Hash.new
  label_list.each do |label|
    label_text = label.text.sub('* ', '')
    element[label_text] = label[:for]
    # p label_text
  end

 # binding.pry
  work_sheet = book.worksheet 'Regression'
  colindex = work_sheet.row(0).index(screen)
  work_sheet.drop(1).each do |row|
    field_name = row[colindex]
    field_value = row[colindex+1]
    # p field_name
    # p field_value
    break if field_name == nil
    if field_value != nil  && field_name != nil
      form_fill(field_name, field_value, element[field_name])
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

Then(/^verify that newly added record is displayed under section "([^"]*)"$/) do |section_title, table|

  section = page.find('h3', :text => section_title, :exact => true, :match => :first)
  section_id = section[:id]
  section_id = section_id.sub('title','body')
  p section_id
  section_table = page.find_by_id(section_id)
  datarow = section_table.all('tr.dataRow')
  header = page.all('table.list tr.headerRow th').map(&:text)
  # datarow = page.all('table.list tr.dataRow')
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
      label = page.find('label', :text => key, :exact => true, :match => :first)
      element_id = label[:for]
      form_fill(key,value,element_id)
    end
  end
end

Then(/^verify that Aircraft status is changed to assigned$/) do |table|
  step "verify that newly added record is displayed in the page", table
end


Then(/^verify that Assembly Utilizations are auto created$/) do |table|
  step "verify that newly added record is displayed in the page", table
end

Then(/^verify that following values are populated in "([^"]*)" section$/) do |section_name, table|

  section = page.find('.pbSubheader', text: section_name)
  td_list = page.find(:xpath, "//div[preceding-sibling::div[@id='"+ section[:id]+ "']]",:match => :first).all('td')
  fields = Hash.new
  (0...td_list.length).step(2) do |i|
    fields[td_list[i].text] = td_list[i+1].text
  end
  # binding.pry
  table.hashes.each do |row|
    row.each do |key,value|
      # elements = page.all('td.labelCol', text: key)
      fields[key].should include(value)
    end
    end
  #
  #     # binding.pry
  #     if elements.count > 1
  #       elements.each do |element|
  #         if element.text == key
  #           elements = element
  #           break
  #         end
  #       end
  #     else
  #       elements = elements.first
  #     end
  #     if elements.find(:xpath,"../td[1]").text == key
  #       actual = elements.find(:xpath,"../td[2]").text
  #     else
  #       actual = elements.find(:xpath,"../td[4]").text
  #     end
  #     actual.should include(value)
  #   end
  # end
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

And(/^verify the pop\-up text "([^"]*)"$/) do |msg_text|
  actual = page.driver.browser.switch_to.alert.text
  p actual
  actual.should include(msg_text)
end

Then(/^verify following field level error message is displayed "([^"]*)"$/) do |error_msg|
  page.find('.errorMsg').text.should include(error_msg)
end

Then(/^verify following message is displayed "([^"]*)"$/) do |msg|
  page.find('.messageText').text.should include(msg)
end


Then(/^verify that newly added record is displayed in the page$/) do |table|
  sleep 2
  header = page.all('table.list tr.headerRow th').map(&:text)
  datarow = page.all('table.list tr.dataRow')
  table.hashes.zip(datarow).each do |row,data|
    row.each do |key,value|
      header.should include(key)
      data.text.should include(value)
    end
  end
end

And(/^navigate to "8429 \(A340\)" aircraft if exists$/) do |arg|
  step "navigate to record if it exists", arg
end

And(/^navigate to record if it exists$/) do |arg|
   if find_link(arg).visible
     click_link(arg)
   end
end


And(/^navigate to "([^"]*)" monthly utilization if exists$/) do |arg|
  step "navigate to record if it exists", arg
end

And(/^navigate to "([^"]*)" invoice if exists$/) do |arg|
  step "navigate to record if it exists", arg
end

And(/^navigate to "([^"]*)" Payment if exists$/) do |arg|
  step "navigate to record if it exists", arg
end

And(/^delete invoice "([^"]*)"$/) do |arg|
  step "user navigates to 'Aircraft' tab"
  step "navigate to '8429 (A340)' aircraft if exists"
  step "navigate to '2013-03-003' monthly utilization if exists"
  step "navigate to '8429-A003-MR' invoice if exists"
  step "navigate to 'Aircraft MR-2015-07' payment and delete if exists"
  step "user clicks on 'Delete' button"
end