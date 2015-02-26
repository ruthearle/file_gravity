require 'sinatra'
require 'rest-client'

enable :sessions

set :session_secret, 'secret key'

get '/' do
  RestClient.get 'http://my.workshare.com/api'
end
