require 'sinatra'
require './lib/work_client'

enable :sessions

set :session_secret, 'secret key'

get '/' do
  erb :index
end

post '/session' do
  @email, @password = params['email'], params['password']
  response = WorkClient.new.login(@email, @password)
  session[:response] = response['my_session_id']
  redirect to '/files'
end

get '/files' do
  erb :files
end
