require 'rubygems'
require './server'

run Sinatra::Application

$stdout.sync = true
