require 'spec_helper'

feature "/files" do

  scenario "displaying a list of" do

    visit '/'
    fill_in 'Email Address', with: "me@ruthearle.com"
    fill_in 'Password', with: "O6lnolvy8E"
    click_on 'Login'
    expect(current_path).to eq '/files'
    expect(page).to have_content 'binary.bin'
  end
end
