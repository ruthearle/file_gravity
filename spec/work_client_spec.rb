require 'work_client'

describe WorkClient do

    let(:email) { 'me@ruthearle.com' }
    let(:password) { 'O6lnolvy8E' }
    let(:client) { WorkClient.new(email, password) }

  describe "#initialize" do
    it "will not raise an error" do
      expect{client}.not_to raise_error
    end
  end

  describe "#login" do
    it "saves a authorisation token when successful " do
      expect(client.login).to have_key 'device_auth_token'
    end
  end

  describe "#get_files" do
    it "provides a list of all files" do
      client.login
      expect(client.get_files).to be_an_instance_of Array
    end
  end
end
