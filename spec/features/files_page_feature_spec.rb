require 'spec_helper'
require_relative '../helpers/login_helper'

include LoginHelper

feature "/files" do

  scenario "cannot be accessed without a person being logged in" do
    visit "/files"
    expect(page).to have_content "Restricted area. Please login for access."
  end

  context 'Display' do

    before(:each) do
      login
    end

    scenario "file category names" do
      expect(page).to have_content 'Video'
    end

    scenario "number of files per category" do
      expect(page).to have_content 'Video 1'
    end

    scenario "basic weight of files per category" do
      expect(page).to have_content 'Video 1 3.12'
    end

    scenario "the total weight for all files" do
      expect(page).to have_content 'Total basic weight (MB): 122.79'
      login("placement@makersacademy.com", "makersWelcome")
    end

    scenario "the gravity displacement for all files" do
      expect(page).to have_content 'Gravity Displacement (MB): 104.16'
    end

  end

end
