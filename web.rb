require 'sinatra'

get '/' do
  haml :index
end

get '/css/style.css' do
  sass :'css/style'
end
