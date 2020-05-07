require 'pg'
require 'spec_helper'

#remember, for the tests, you have to create new data every time before you do the rest of the test -
#this is because of the TRUNCATE element. This means that every time you write a new test, the information is deleted,
#so you need to make a new one. Helpful in case things change for the test scenario.

feature 'it shows a list of diary entries' do
  scenario 'list of diary entries on home page' do
    DiaryEntry.create(entry: "This is an entry", date: "date")
    visit('/')
    expect(page).to have_content("This is an entry")
  end
end

feature 'it creates a new entry' do
  scenario 'you can submit a new entry with date, and it will show in list of entries' do
    visit('/new_entry')
    fill_in('entry', with: 'This is another entry')
    fill_in('date', with: 'date')
    click_button('Add Entry')
    expect(page).to have_content("This is another entry")
  end
end
