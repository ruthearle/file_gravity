module LoginHelper

  def login(email= 'me@ruthearle.com', password= 'makersWelcome')
    visit '/'
    fill_in "email", with: email
    fill_in "password", with: password
    click_on 'Login'
    expect(current_path).to eq '/files'
  end

end
