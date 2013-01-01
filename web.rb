require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
  set :haml, {format: :html5}
  set :sass, Compass.sass_engine_options
end

get '/' do
  @message = 'default message'
  haml :index
end

get '/for/:name' do
  @message = "message for #{params[:name]}"
  haml :index
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"css/#{params[:name]}", Compass.sass_engine_options
end
