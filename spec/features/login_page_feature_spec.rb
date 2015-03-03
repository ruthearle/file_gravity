require 'spec_helper'

feature '/login' do

  context 'A person can login' do
    scenario 'correct credentials' do
      visit '/'
      fill_in 'Email Address', with: "placement@makersacademy.com"
      fill_in 'Password', with: "makersWelcome"
      click_on 'Login'
      expect(current_path).to eq '/files'
      expect(page).to have_content 'Welcome, placement@makersacademy'
    end
  end

  #scenario 'A person cannot login with incorrect credentials' do
    #visit '/'
    #fill_in 'Email Address', with: "placement@makersacademy.com"
    #fill_in 'Password', with: "makerswelcome"
    #click_on 'Login'
    #expect(current_path).to eq '/'
    #expect(page).to have_content 'Incorrect email of password. Please try again.'
  #end

  scenario 'A person can logout' do
    visit '/'
    fill_in 'Email Address', with: "placement@makersacademy.com"
    fill_in 'Password', with: "makersWelcome"
    click_on 'Login'
    expect(current_path).to eq '/files'
    click_on 'Logout'
    expect(current_path).to eq '/'
    expect(page).to have_content "Thank you for using File Gravity, goodbye."
  end
end
