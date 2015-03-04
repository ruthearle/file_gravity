require 'sinatra'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative './lib/client.rb'
require_relative './lib/file_meta.rb'


enable :sessions, :method_override
set :session_secret, 'super secret'
set :partial_template_engine, :erb

get '/' do
  erb :index
end

post '/session' do
  email, password = params[:email], params[:password]
  client = Client.new(email, password)
  client.login
  if response.code == 500
    flash[:now] = "Invalid email or password. Pleaase try again."
    redirect to '/'
  else
  session['email'] = email
  session['password'] = password
  redirect to '/files'

  end
end


get '/files' do
  if session['email']
    client = Client.new(session['email'], session['password'])
    client.login
    files = client.get_files
    @data = FileMeta.new(files)
    erb :files
  else
    erb :restricted
  end
end

delete '/session' do
  client = Client.new(session[:email], session[:password])
  client.login
  client.logout
  session[:email] = nil
  session[:password] = nil
  flash[:next] = "Thank you for using File Gravity, goodbye."
  redirect to '/'
end

error do
  erb :error
end
