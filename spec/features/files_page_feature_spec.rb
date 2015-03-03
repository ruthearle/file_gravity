require 'spec_helper'
require_relative '../helpers/login_helper'

include LoginHelper

feature "/files" do

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
    expect(page).to have_content 'Total basic weight (megabytes): 122.79'
  end



end
