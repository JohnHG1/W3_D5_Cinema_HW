require_relative("../db/sql_runner")

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  # def customers()
  #   sql = "SELECT * FROM customer
  #   WHERE id = $1"
  #   values = [@customer_id]
  #   customer = SqlRunner.run( sql,values )
  #   result = Customer.new(customer.first)
  #   return result
  # end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customer.id
    WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return Customer.map_items(customers)
  end


  def tickets()
    sql = "SELECT * FROM ticket
    WHERE id = $1"
    values = [@ticket_id]
    ticket = SqlRunner.run( sql,values )
    result = Ticket.new( ticket.first )
    return result
  end

  def delete()
    sql = "DELETE FROM films where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.map_items(film_data)
    result = film_data.map{|film| Film.new(film)}
    return result
  end

  def self.all
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map {|film| Film.new(film)}
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end


end
