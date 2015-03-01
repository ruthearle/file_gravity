require 'sinatra'
require './lib/work_client'

enable :sessions
set :session_secret, 'super secret'

get '/' do
  erb :index
end


post '/session' do
  email, password = params['email'], params['password']
  client = WorkClient.new(email, password)
  client.login
  session[:email] = email
  session[:password] = password
  redirect to '/files'
end

get '/files' do
  client = WorkClient.new(session[:email], session[:password])
  client.login
  @files = client.get_files
  erb :files
end
