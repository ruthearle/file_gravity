module LoginHelper

  def login(email, password)
    visit '/'
    fill_in "email", with: email
    fill_in "password", with: password
    click_on 'Login'
  end

end
