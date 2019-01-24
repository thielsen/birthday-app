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
    month = Time.now.strftime("%B")
    p month
    visit('/')
    fill_in "name", :with => "Bob"
    fill_in "day", :with => Time.now.day

    find(:xpath, '//option[contains(text(), "January")]').select_option
    click_button "Go!"
    p page.body
  end

  scenario 'confirms entering date gives you correct output' do
    visit('/')
    fill_in "name", :with => "Bob"
    fill_in "day", :with => 17
    find(:xpath, '//option[contains(text(), "February")]').select_option
    click_button "Go!"
    p page.body
  end

end
