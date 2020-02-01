require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds]
    SqlRunner.run(sql, values)
  end

  def films()
      sql = "SELECT * FROM film
      WHERE id = $1"
      values = [@film_id]
      film = SqlRunner.run(sql,values )
      result = Film.new(film.first )
      return result
    end

  def tickets()
      sql = "SELECT * FROM ticket
      WHERE id = $1"
      values = [@ticket_id]
      ticket = SqlRunner.run(sql,values )
      result = Ticket.new( ticket.first )
      return result
    end

  def delete()
    sql = "DELETE from customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.map_items(data)
    result = data.map{|customer| Customer.new(customer)}
    return result
  end

  def self.all
    sql = "SELECT * FROM customers"
    stars = SqlRunner.run(sql)
    return customers.map {|customer| Customer.new(customer)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
