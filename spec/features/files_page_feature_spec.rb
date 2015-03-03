require 'spec_helper'

feature "/files" do

  scenario "displaying file category names of" do

    visit '/'
    fill_in 'Email Address', with: "placement@makersacademy.com"
    fill_in 'Password', with: "makersWelcome"
    click_on 'Login'
    expect(current_path).to eq '/files'
    expect(page).to have_content 'Video'
  end
end
