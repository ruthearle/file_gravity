require 'sinatra'
require 'sinatra/flash'
require './lib/client.rb'
require './lib/file_meta.rb'

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
  @data = FileMeta.new(@files)
  erb :files
end

delete '/session' do
  flash[:next] = "Thank you for using File Gravity, goodbye."
  client = Client.new(session[:email], session[:password])
  client.login
  client.logout
  session[:email] = nil
  session[:password] = nil
  redirect to '/'
end
