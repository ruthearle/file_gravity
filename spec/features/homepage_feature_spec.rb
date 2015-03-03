require 'spec_helper'
require_relative '../helpers/login_helper'

include LoginHelper

feature '/login' do

  context 'A person can login' do
    scenario 'correct credentials' do
      login("placement@makersacademy.com", "makersWelcome")
      expect(current_path).to eq '/files'
      expect(page).to have_content 'Welcome, placement@makersacademy'
    end

    xscenario 'incorrect credentials' do
      login("me@ruthearle.com", "makerswelcome")
      expect(current_path).to eq '/'
      expect(page).to have_content 'Incorrect  email or password. Please try again.'
    end
  end

  scenario 'A person can logout' do
    login("placement@makersacademy.com", "makersWelcome")
    expect(current_path).to eq '/files'
    click_on 'Logout'
    expect(current_path).to eq '/'
    expect(page).to have_content "Thank you for using File Gravity, goodbye."
  end
end
