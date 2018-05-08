require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )

get '/cities' do
  @countries = Country.all()
  @cities = City.all()
  erb ( :"city/index" )
end

get '/cities/:id' do
  @city = City.find(params['id'].to_i)
  erb(:"city/edit")
end

post '/cities' do # create
  @city = City.new( params )
  @city.save()
  redirect to ('/cities')
end

post '/cities/:id/update' do
  @city = City.new( params )
  @city.update()
  redirect to ('/cities')
end

post '/cities/:id/delete' do
  @city = City.find( params[:id] )
  @city.delete()
  redirect to ('/cities')
end
