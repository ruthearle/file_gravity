require 'sinatra'
require './lib/client'

enable :sessions
set :session_secret, 'super secret'

get '/' do
  erb :index
end


post '/session' do
  email, password = params['email'], params['password']
  client = Client.new(email, password)
  client.login
  session[:email] = email
  session[:password] = password
  redirect to '/files'
end

get '/files' do
  client = Client.new(session[:email], session[:password])
  client.login
  @files = client.get_files
  erb :files
end
