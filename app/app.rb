require 'rubygems'
require 'sinatra'
require './config/init'

#
# Before any route is run
before do
  @path = request.env['SCRIPT_NAME']
end

#
# Routes

match '/' do
  erb :index
end

match '/city/:name/?' do
  @city = params[:name]
  @homepage = Craig.homepage(@city)
  puts @homepage.inspect
  
  erb :city
end

match '/city/:name/:section/?' do
  @city = params[:name]
  @slug = params[:section]

  @section = Craig.section(@city, @slug)
  puts @section.inspect

  erb :section
end