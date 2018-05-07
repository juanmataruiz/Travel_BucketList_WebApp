require_relative( '../db/sql_runner' )

class Visit

  attr_reader( :country_id, :city_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @country_id = options['country_id'].to_i
    @city_id = options['city_id'].to_i
  end

  def save()
    sql = "INSERT INTO visits
    (
      country_id,
      city_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@country_id, @city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM visits"
    results = SqlRunner.run( sql )
    return results.map { |visit| Visit.new( visit ) }
  end

  def city()
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [@city_id]
    results = SqlRunner.run( sql, values )
    return City.new( results.first )
  end

  def country()
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [@country_id]
    results = SqlRunner.run( sql, values )
    return Country.new( results.first )
  end

  def self.find( id )
    sql = "SELECT * FROM visits WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Visit.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM visits"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM visits WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
