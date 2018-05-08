require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/journey.rb' )


get '/journeys' do
  @journeys = Journey.all()
  erb ( :"journey/index" )
end

get '/journeys/new' do
  @countries = Country.all()
  @cities = City.all()
  erb(:"journey/new")
end

get '/journeys/:id' do
  @journey = Journey.find(params['id'].to_i)
  erb(:"city/edit")
end

post '/journeys' do # create
  @journey = Journey.new( params )
  @journey.save()
  redirect to ('/journeys')
end

post '/journeys/:id/update' do
  @journey = Journey.new( params )
  @journey.update()
  redirect to ('/journeys')
end

post '/journeys/:id/delete' do
  @journey = Journey.find( params[:id] )
  @journey.delete()
  redirect to ('/journeys')
end
