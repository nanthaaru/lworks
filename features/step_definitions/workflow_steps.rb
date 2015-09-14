require 'spreadsheet'

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open File.expand_path(EXCEL_WORKBOOK, __FILE__)

Given(/^user logins and navigates to home page$/) do
  visit '/'
  # page.driver.browser.manage.window.maximize
  Capybara.current_session.driver.browser.manage.window.resize_to(1280, 1024)
  puts LOGIN_USER
  puts LOGIN_PASSWORD
  page.fill_in 'username', :with => LOGIN_USER
  page.fill_in 'password', :with => LOGIN_PASSWORD
  page.click_button 'Login'
  page.click_link 'Home'
end

def form_fill(field_name, value, element_id)
  element = page.find_by_id(element_id)
  if field_name != 'Owner'
    if element.tag_name == 'select'
      element.select value
    else
      if element.tag_name == 'input'
        if element[:type] == 'text'
          if element.class == 'dateInput'
            element.set value
          else
            element.set value
          end
        else
          if element[:type] == 'checkbox'
            element.click
          end
        end
      end
      if element.tag_name == 'textarea'
        element.set value
      end
    end
  end
end

When(/^user fill\-in "([^"]*)" information from regression/) do |screen|
  label_list = page.all('label', :text => '')
  element = Hash.new
  label_list.each do |label|
    label_text = label.text.sub('* ', '')
    element[label_text] = label[:for]
  end
  work_sheet = book.worksheet EXCEL_WORKSHEET
  colindex = work_sheet.row(0).index(screen)
  work_sheet.drop(1).each do |row|
    field_name = row[colindex]
    field_value = row[colindex+1]
    break if field_name == nil
    if field_value != nil && field_name != nil
      form_fill(field_name, field_value, element[field_name])
    end
  end
end

And(/^user clicks on "([^"]*)" button$/) do |btn_name|
  click_button(btn_name, :match => :first)
  sleep 2
end

Then(/^verify that newly added record is displayed under section "([^"]*)"$/) do |section_title, table|
  section = page.find('h3', :text => section_title, :exact => true, :match => :first)
  section_id = section[:id]
  section_id = section_id.sub('title', 'body')
  section_table = page.find_by_id(section_id)
  datarow = section_table.all('tr.dataRow')
  header = page.all('table.list tr.headerRow th').map(&:text)
  # datarow = page.all('table.list tr.dataRow')
  table.hashes.zip(datarow).each do |row, data|
    row.each do |key, value|
      header.should include(key)
      if value.include? 'YEAR_MONTH'
        date = Time.now
        date = date.localtime("+05:30").strftime('%Y-%m')
        value.slice! 'YEAR_MONTH'
        value = value + date
      end
      if value.include? 'TODAYS_DATE'
        date = Time.now
        date = date.localtime("+05:30").strftime('%-m/%-d/%Y')
        value.slice! 'TODAYS_DATE'
        value = value + date
      end
      data.text.should include(value)
    end
  end
end

When(/^user navigates to "([^"]*)" tab$/) do |tab_name|
  click_link(tab_name, :match => :first)
end

And(/^accept browser pop\-up$/) do
  page.driver.browser.switch_to.alert.accept
end

And(/^user selects newly added "([^"]*)"/) do |aircraft_name|
  click_link(aircraft_name, :exact => true, :match => :first)
end

Then(/^Verify that aircraft "([^"]*)" is deleted$/) do |aircraft_name|
  datarow = page.all('table.list tr.first .dataCell').map(&:text)
  datarow.should_not include(aircraft_name)
end

And(/^user fill\-in aircraft "([^"]*)" section$/) do |arg, table|
  # table is a table.hashes.keys # => [:Line #, :Number Of Landing Gears]
  table.hashes.each do |row|
    row.each do |key, value|
      label = page.find('label', :text => key, :exact => true, :match => :first)
      element_id = label[:for]
      form_fill(key, value, element_id)
    end
  end
end

Then(/^verify that Aircraft status is changed to assigned$/) do |table|
  step 'verify that newly added record is displayed in the page', table
end

Then(/^verify that Assembly Utilizations are auto created$/) do |table|
  step 'verify that newly added record is displayed in the page', table
end

Then(/^verify that following values are populated in "([^"]*)" section$/) do |section_name, table|
  section = page.find('.pbSubheader', text: section_name)
  td_list = page.find(:xpath, "//div[preceding-sibling::div[@id='"+ section[:id]+ "']]", :match => :first).all('td')
  fields = Hash.new
  (0...td_list.length).step(2) do |i|
    fields[td_list[i].text] = td_list[i+1].text
  end
  table.hashes.each do |row|
    row.each do |key, value|
      fields[key].should include(value)
    end
  end
end

And(/^user selects assembly utilization "([^"]*)"$/) do |item_type|
  element = page.find('td.dataCell', :text => item_type, :match => :first)
  page.click_link element.find(:xpath, '../th').text
end

Then(/^verify following error message is displayed "([^"]*)"$/) do |error_msg|
  page.find('.pbError').text.should include(error_msg)
end

And(/^verify the pop\-up text "([^"]*)"$/) do |msg_text|
  actual = page.driver.browser.switch_to.alert.text
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
  table.hashes.zip(datarow).each do |row, data|
    row.each do |key, value|
      header.should include(key)
      data.text.should include(value)
    end
  end
end

And(/^user clicks on "([^"]*)" link$/) do |link_text|
  click_link(link_text, :exact => true, :match => :first)
end

And(/^user select "([^"]*)" for "([^"]*)"$/) do |value, label|
  label_element = page.find('label', :text => label, :exact => true, :match => :first)
  form_fill(label, value, label_element[:for])
end

Then(/^verify that following values are populated in "([^"]*)" header section$/) do |section_header_name, table|
  td_list = page.find('.pbSubsection', :match => :first).all('td')
  fields = Hash.new
  (0...td_list.length).step(2) do |i|
    fields[td_list[i].text] = td_list[i+1].text
  end
  table.hashes.each do |row|
    row.each do |key, value|
      fields[key].should include(value)
    end
  end
end