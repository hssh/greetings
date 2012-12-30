require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
  # set :haml, {format: :html5, escape_html: true}
  set :haml, {format: :html5}
  set :sass, Compass.sass_engine_options
end

get '/' do
  haml :index
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"css/#{params[:name]}", Compass.sass_engine_options
end
