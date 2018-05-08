require_relative( '../db/sql_runner' )
require('pry')
class Journey

  attr_reader( :city_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @city_id = options['city_id'].to_i
  end

  def save()
    sql = "INSERT INTO journeys
    (
      city_id
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE journeys SET city_id = $1 WHERE id = $2"
    values = [@city_id, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM journeys"
    results = SqlRunner.run( sql )
    return results.map { |journey| Journey.new( journey ) }
  end

  def city()
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [@city_id]
    results = SqlRunner.run( sql, values )
    return City.new( results.first )
  end


  def self.find( id )
    sql = "SELECT * FROM journeys WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Journey.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM journeys"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM journeys WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
