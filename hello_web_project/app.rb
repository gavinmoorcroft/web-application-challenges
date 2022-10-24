require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return "Hi!! Thanks for visiting my little web app."
 
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]
    
    return "Thanks #{name}, you sent this message: #{message}"
  end

  get '/name' do
    names = "Julia, Mary, Karim"

    return "Hi, the names you are looking for are: #{names}"
  end

  post '/sort_names' do
    names = params[:names]

    sorted_names = names.split(',').sort.join(',')
    return sorted_names
  end

  # 404
  not_found do
    return "Hi there, sorry but we do not recognise that request. Please check and try again"
  end
end
