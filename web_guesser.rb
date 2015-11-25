require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(guess)
  if guess.to_i > SECRET_NUMBER && (guess.to_i - SECRET_NUMBER).abs > 5
    "Way too high!"
  elsif guess.to_i < SECRET_NUMBER && (guess.to_i - SECRET_NUMBER).abs > 5
    "Way too low!"
  elsif guess.to_i < SECRET_NUMBER
    "Too low!"
  elsif guess.to_i > SECRET_NUMBER
    "Too high!"
  else
    "You got it right! The secret number is #{SECRET_NUMBER}."
  end
end

def background_color(guess)
  if guess.to_i > SECRET_NUMBER && (guess.to_i - SECRET_NUMBER).abs > 5
    "red"
  elsif guess.to_i < SECRET_NUMBER && (guess.to_i - SECRET_NUMBER).abs > 5
    "red"
  elsif guess.to_i < SECRET_NUMBER
    "#F75D59"
  elsif guess.to_i > SECRET_NUMBER
    "#F75D59"
  else
    "green"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {
                :number => SECRET_NUMBER,
                :message => check_guess(guess),
                :background_color => background_color(guess)
                }
end