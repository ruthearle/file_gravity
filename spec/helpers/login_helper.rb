module LoginHelper

  def login(email, password)
    visit '/'
    fill_in 'Email Address', :with => email
    fill_in 'Password', :with => password
    click_on 'Login'
  end

end
