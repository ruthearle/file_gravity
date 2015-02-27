require 'sinatra'
require 'rest-client'

enable :sessions

set :session_secret, 'secret key'

get '/' do
  erb :index
end

post '/session' do
  email, password = params['email', 'password']
  RestClient.get 'http://my.workshare.com/'
end
