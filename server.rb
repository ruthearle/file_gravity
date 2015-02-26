require 'sinatra'
require 'rest-client'

enable :sessions

set :session_secret, 'secret key'

get '/' do
  erb :index
end
