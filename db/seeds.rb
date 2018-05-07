require_relative( "../models/city.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/journey.rb" )
require("pry")

Journey.delete_all()
City.delete_all()
Country.delete_all()


country1 = Country.new({
  "name" => "Japan"
  })
country2 = Country.new({
  "name" => "Spain"
  })
country3 = Country.new({
  "name" => "France"
  })

country1.save()
country2.save()
country3.save()

city1 = City.new({
  "name" => "Kyoto",
  "country_id" => country1.id()
  })
city2 = City.new({
  "name" => "Osaka",
  "country_id" => country1.id()
  })
city3 = City.new({
  "name" => "Malaga",
  "country_id" => country2.id()
  })
city4 = City.new({
  "name" => "Barcelona",
  "country_id" => country2.id()
  })
city5 = City.new({
  "name" => "Paris",
  "country_id" => country3.id()
  })
city6 = City.new({
  "name" => "Lyon",
  "country_id" => country3.id()
  })

city1.save()
city2.save()
city3.save()
city4.save()
city5.save()
city6.save()

journey1 = Journey.new({
  "country_id" => country1.id(),
  "city_id" => city1.id()
  })
journey2 = Journey.new({
  "country_id" => country2.id(),
  "city_id" => city2.id()
  })
journey3 = Journey.new({
  "country_id" => country3.id(),
  "city_id" => city3.id()
  })

journey1.save()
journey2.save()
journey3.save()
