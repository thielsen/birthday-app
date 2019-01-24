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
    fill_in "name", :with => "Bob"
    fill_in "day", :with => Date.today.day
    find(:xpath, '//option[contains(text(), "January")]').select_option
    click_button "Go!"
    expect(page).to have_content('Happy Birthday')
  end

  scenario 'confirms entering tomorrows date gives you 1 day to go' do
    visit('/')
    fill_in "name", :with => "Bob"
    fill_in "day", :with => 25
    find(:xpath, '//option[contains(text(), "January")]').select_option
    click_button "Go!"
    expect(page).to have_content('1 days')
  end

  scenario 'confirms entering yesterdays date gives you 364 day to go' do
    visit('/')
    fill_in "name", :with => "Bob"
    fill_in "day", :with => 23
    find(:xpath, '//option[contains(text(), "January")]').select_option
    click_button "Go!"
    expect(page).to have_content('364 days')
  end

end
