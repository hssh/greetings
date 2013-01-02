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

def find_card_to(recipient)
  card_collection = mongo_client['greetings']['cards']
  doc = card_collection.find_one({recipient: recipient})
  if doc.nil?
    doc = card_collection.find_one({recipient: 'default'})
  end
  doc
end

get '/' do
  @card = find_card_to('default')
  haml :index
end

get '/to/:recipient' do
  @card = find_card_to(params[:recipient])
  haml :index
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"css/#{params[:name]}", Compass.sass_engine_options
end
