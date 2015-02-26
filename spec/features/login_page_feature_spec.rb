require 'spec_helper'

feature 'Login' do
  scenario 'A person can login' do
    visit '/'
    expect(page).to have_text 'File Gravity'
  end
end
