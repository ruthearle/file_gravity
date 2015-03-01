require 'httparty'

class WorkClient

  CONFIG = YAML::load_file('config.yml')

  include HTTParty
  base_uri CONFIG['base_uri']

  def initialize(email, password)
    @user_session = {
      "user_session" => {"email"=> email, "password" => password},
      "device" => {"app_uid" => CONFIG['api_key']}
    }
  end

  def login
    response = self.class.post(CONFIG['login_uri'], query: @user_session)
    @api_session = response['device_auth_token']
    response
  end

  def get_files
    response = self.class.get(CONFIG['files_meta'], cookies: {device_credentials: @api_session})
    response
  end

end
