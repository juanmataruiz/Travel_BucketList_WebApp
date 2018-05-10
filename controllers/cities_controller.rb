require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )

#INDEX
get '/cities' do
  @countries = Country.all()
  @cities = City.all()
  erb ( :"city/index" )
end

#NEW
get '/cities/new' do
  @countries = Country.all()
  @cities = City.all()
  erb(:"city/new")
end

#SHOW
get '/cities/:id' do
  @city = City.find(params['id'].to_i)
  erb(:"city/show")
end


post '/cities' do # create
  @city = City.new( params )
  @city.save()
  redirect to ('/cities')
end

get '/cities/:id/edit' do
  @city = City.find( params[:id] )
  erb(:'city/edit')
end

#UPDATE
post '/cities/:id' do
  @city = City.new( params )
  @city.update()
  redirect to ('/cities')
end

#DELETE
post '/cities/:id/delete' do
  @city = City.find( params[:id] )
  @city.delete()
  redirect to ('/cities')
end
