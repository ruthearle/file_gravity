require 'spec_helper'

feature "/files" do

  scenario "displaying file category names" do

    visit '/'
    fill_in 'Email Address', with: "placement@makersacademy.com"
    fill_in 'Password', with: "makersWelcome"
    click_on 'Login'
    expect(current_path).to eq '/files'
    expect(page).to have_content 'Video'
  end

  scenario "display number of files per category" do
    visit '/'
    fill_in 'Email Address', with: "placement@makersacademy.com"
    fill_in 'Password', with: "makersWelcome"
    click_on 'Login'
    expect(current_path).to eq '/files'
    expect(page).to have_content '2'
  end

end
