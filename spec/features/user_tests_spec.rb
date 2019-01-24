require './app'

RSpec.describe Birthday do

  scenario 'confirms home page is working' do
    visit('/')
    expect(page).to have_content('When is your birthday?')
  end

end
