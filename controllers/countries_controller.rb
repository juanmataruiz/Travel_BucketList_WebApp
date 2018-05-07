require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country.rb' )

get '/countries' do
  @countries = Country.all()
  erb ( :"country/index" )
end

get '/countries/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"country/show")
end

post '/country' do
  country = Country.new(params)
  country.save
  redirect to("/country")
end
