require 'spec_helper'
require_relative '../helpers/login_helper'

include LoginHelper

feature '/' do

  scenario 'A person can login' do
    login
    expect(page).to have_content 'Welcome, me@ruthearle.com'
  end

  scenario 'A person can logout' do
    login
    click_on 'Logout'
    expect(current_path).to eq '/'
    expect(page).to have_content "Thank you for using File Gravity, goodbye."
  end

  xscenario 'A person cannot login with incorrect credentials' do
    visit '/'
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: 'password'
    click_on 'Login'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Invalid email or password. Pleaase try again.'
  end

end
