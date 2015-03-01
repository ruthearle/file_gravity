require 'sinatra'
require './lib/work_client'

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

  erb :files
end
