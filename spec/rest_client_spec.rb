require 'restful_client'

describe RestfulClient do
  describe "#initialize" do
    it "is done with a persons email and password" do
      email = 'email@email.com'
      password = 'password'
      expect(RestClient.new(email, password)).not_to raise_error
    end
  end
end
