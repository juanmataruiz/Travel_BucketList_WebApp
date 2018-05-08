require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country.rb' )
require("pry")


get '/countries' do
  @countries = Country.all()
  erb ( :"country/index" )
end

get '/countries/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"country/edit")
end

get '/countries/visited' do
  @country = Country.countries_visited(params['id'].to_i)
  erb(:"country/show")
end

post '/countries' do # create
  @country = Country.new( params )
  @country.save()
  redirect to ('/countries')
end

post '/countries/:id/update' do
  @country = Country.new( params )
  @country.update()
  redirect to ('/countries')
end

post '/countries/:id/delete' do
  @country = Country.find( params[:id] )
  @country.delete()
  redirect to ('/countries')
end
