require 'spec_helper'

feature 'Login' do
  scenario 'A person can login' do
    visit '/'
    expect(page).to have_text 'File Gravity'
  end

  scenario 'A person can fill in login details' do
    visit '/'
    fill_in 'Email Address', with: "email@email.com"
    fill_in 'Password', with: "password"
    click_on 'Login'
    expect(current_path).to eq '/files'
    expect(page).to have_content 'Welcome'
  end
end
