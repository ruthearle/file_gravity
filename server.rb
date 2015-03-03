require 'sinatra'
require 'sinatra/flash'
require_relative './lib/client.rb'
require_relative './lib/file_meta.rb'


enable :sessions, :method_override
set :session_secret, 'super secret'
#set :views, 'app/views'

get '/' do
  erb :index
end


post '/session' do
  email, password = params['email'], params['password']
  client = Client.new(email, password)
  client.login
  if client.login.code
    session[:email] = email
    session[:password] = password
    redirect to '/files'
  else
    flash[:error] = 'Incorrect email or password. Please try again.'
    redirect to '/'
  end
end

get '/files' do
  client = Client.new(session[:email], session[:password])
  client.login
  files = client.get_files
  @data = FileMeta.new(files)
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
