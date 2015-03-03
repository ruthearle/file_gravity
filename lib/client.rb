require 'httparty'

class Client

  attr_accessor :user_session, :api_session

  API = YAML::load_file('api.yml')

  include HTTParty
  base_uri API['base_uri'] || API = ENV['BASE_URI']

  def initialize(email, password)
    self.user_session = {
      "user_session" => {"email"=> email, "password" => password},
      "device" => {"app_uid" => API['api_key']}
    }
  end

  def login
    response = self.class.post(API['login_uri'], query: user_session)
    self.api_session = response['device_auth_token']
    response
  end

  def get_files
    files_list = self.class.get(API['files_uri'], cookies: {device_credentials: api_session})
    files_metadata = files_list.parsed_response
    files_metadata['files']
  end

  def logout
    self.class.get(API['logout_uri'])
    #api_session = ''
    #response['devise_credentials'] = api_session
    #api_session
  end

end
