require './app'
RSpec.describe Birthday do

  scenario 'confirms home page is working' do
    visit('/')
    expect(page).to have_content("When's your birthday?")
  end

  scenario 'confirms entering name gives you a greeting' do
    visit('/')
    fill_in "name", :with => "Bob"
    click_button "Go!"
    expect(page).to have_content('Bob')
  end

  scenario 'confirms entering todays date gives you a happy birthday' do
    visit('/')
    fill_in "name", :with => "Alice"
    fill_in "day", :with => Date.today.day
    select "#{Date::MONTHNAMES[Date.today.month]}", from: 'month'
    click_button "Go!"
    expect(page).to have_content('Happy Birthday')
  end

  scenario 'confirms entering tomorrows date gives you 1 day to go' do
    visit('/')
    tomorrow = Date.today + 1
    fill_in "name", :with => "Alice"
    fill_in "day", :with => tomorrow.day
    select "#{Date::MONTHNAMES[tomorrow.month]}", from: 'month'
    click_button "Go!"
    expect(page).to have_content('1 days')
  end

  scenario 'confirms entering yesterdays date gives you 364 day to go' do
    visit('/')
    yesterday = Date.today - 1
    fill_in "name", :with => "Bob"
    fill_in "day", :with => yesterday.day
    select "#{Date::MONTHNAMES[yesterday.month]}", from: 'month'
    click_button "Go!"
    expect(page).to have_content('364 days')
  end

end
