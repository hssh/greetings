require 'sinatra'
require 'haml'
require 'sass'
require 'compass'
require 'mongo'
include Mongo

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
  set :haml, {format: :html5}
  set :sass, Compass.sass_engine_options
end
configure :development do
  require 'pp'
  require 'debugger'
end

def mongo_client
  @client = @client || MongoClient.from_uri
end

def message(to)
  message_collection = mongo_client['greetings']['messages']
  doc = message_collection.find_one({to: to})
  if doc.nil?
    doc = message_collection.find_one({to: 'default'})
  end
  doc['message']
end

get '/' do
  @message = message('default')
  haml :index
end

get '/to/:to' do
  @message = message(params[:to])
  haml :index
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"css/#{params[:name]}", Compass.sass_engine_options
end
