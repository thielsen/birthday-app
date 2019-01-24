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

  # scenario 'confirms entering todays date gives you a happy birthday' do
  #   visit('/')
  # end

end
