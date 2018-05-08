require_relative( '../db/sql_runner' )

class City

  attr_reader( :id, :country_id  )
  attr_accessor( :name )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO cities
    (
      name,
      country_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE cities SET ( name, country_id ) = ( $1, $2 )
    WHERE id = $3"
    values = [@name, @country_id, @id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM cities"
    results = SqlRunner.run( sql )
    return results.map { |city| City.new( city ) }
  end

  def self.find( id )
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return City.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM cities"
    SqlRunner.run( sql )
  end

  def delete
    sql = "DELETE FROM cities WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

end
