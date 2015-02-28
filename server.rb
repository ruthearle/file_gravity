require 'sinatra'
require './lib/work_client'

enable :sessions

set :session_secret, 'secret key'

get '/' do
  erb :index
end

post '/session' do
  email, password = params['email'], params['password']
  client = WorkClient.new(email, password)
  response = client.login
  session[:user_id] = response['device_auth_token']
  redirect to '/files'
end

get '/files' do
  erb :files
end
