require 'work_client'

describe WorkClient do

      email = 'placement@makersacademy.com'
      password = 'makersWelcome'
      client = WorkClient.new(email, password)

  describe "#initialize" do
    it "will not raise an error" do
      email = 'placement@makersacademy.com'
      password = 'makersWelcome'
      expect{client}.not_to raise_error
    end
  end

  describe "#login" do
    it "saves a authorisation token when successful " do
      expect(client.login).to have_key 'device_auth_token'
    end
  end
end
