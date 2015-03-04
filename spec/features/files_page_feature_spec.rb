require 'spec_helper'
require_relative '../helpers/login_helper'

include LoginHelper

feature "/files" do

  scenario "cannot be accessed without a person being logged in" do
    visit "/files"
    expect(current_path).to eq '/files'
    expect(page).to eq "Restricted area. Please login to for access."
  end

  before(:each) do
    login
  end

  scenario "displaying file category names" do
    expect(page).to have_content 'Video'
  end

  scenario "display number of files per category" do
    expect(page).to have_content 'Video 1'
  end

  scenario "display basic weight of files per category" do
    expect(page).to have_content 'Video 1 3.12'
  end

  scenario "shows the total weight for all files" do
    expect(page).to have_content 'Total basic weight (MB): 122.79'
    login("placement@makersacademy.com", "makersWelcome")
  end

  scenario "shows the gravity displacement for all files" do
    expect(page).to have_content 'Gravity Displacement (MB): 104.16'
  end



end
