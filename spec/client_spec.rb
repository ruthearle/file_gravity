require './app/lib/client'

describe Client do

    let(:email)    { 'placement@makersacademy.com' }
    let(:password) { 'makersWelcome' }
    let(:client)   { Client.new(email, password) }

  describe "#initialize" do
    it "will not raise an error" do
      expect{client}.not_to raise_error
    end
  end

  describe "#login" do
    it "saves an authentication token when successful " do
      expect(client.login).to have_key 'device_auth_token'
    end
  end

  describe "#get_files" do
    it "provides a list of all files" do
      client.login
      expect(client.get_files).to be_an_instance_of Array
    end
  end

  describe "#logout" do
    it "deletes the authentication token from the session" do
      client.logout
      expect(client.api_session).to eq nil
    end
  end
end
