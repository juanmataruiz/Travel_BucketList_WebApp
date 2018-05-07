require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/journey.rb' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )


get '/journeys' do
  @journeys = Journey.all
  erb ( :"journey/index" )
end

get '/journeys/new' do
  @cities = City.all
  @countries = Country.all
  erb(:"journey/new")
end

post '/journeys' do
  journey = Journey.new(params)
  journey.save
  redirect to "/"
end

post '/journeys/:id/delete' do
  Journey.destroy(params[:id])
  redirect to("/journey")
end
