require 'spec_helper'
require_relative '../helpers/login_helper'

include LoginHelper

feature "/files" do

  before(:each) do
    login("me@ruthearle.com","makersWelcome")
  end

  scenario "displaying file category names" do
    expect(current_path).to eq '/files'
    expect(page).to have_content 'Video'
  end

  scenario "display number of files per category" do
    expect(current_path).to eq '/files'
    expect(page).to have_content 'Video 1'
  end

  scenario "display basic weight of files per category" do
    expect(current_path).to eq '/files'
    expect(page).to have_content 'Video 1 3.12'
  end

  scenario "shows the total weight for all files" do

  end



end
