require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = guess_review(guess)
  color = color_selector(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :output => message, :input_guess => guess, :color => color}
end

def guess_review(guess)
  if guess > SECRET_NUMBER + 10
    message = "Way too high!"
  elsif guess > SECRET_NUMBER
    message = "Slightly too high!"
  elsif guess < SECRET_NUMBER - 10
    message = "Way too low..."
  elsif guess < SECRET_NUMBER
    message = "Slightly too low..."
  else
    message = "The secret number is #{SECRET_NUMBER}. You got it right!"
  end
end

def color_selector(guess)
  if guess > SECRET_NUMBER + 10
    color = "red"
  elsif guess > SECRET_NUMBER
    color = "Tomato"
  elsif guess < SECRET_NUMBER - 10
    color = "red"
  elsif guess < SECRET_NUMBER
    color = "Tomato"
  else
    color = "SeaGreen"
  end
end
