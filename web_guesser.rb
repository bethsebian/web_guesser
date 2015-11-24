require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
get '/' do
  "The secret numberasfsaf is #{number}."
end