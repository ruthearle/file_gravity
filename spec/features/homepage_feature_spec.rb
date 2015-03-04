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
end
