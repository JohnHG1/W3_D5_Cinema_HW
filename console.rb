require('pry-byebug')

require_relative('models/film')
require_relative('models/customer')
require_relative('models/ticket')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


  film1 = Film.new({
    'title' => 'Jaws',
    'price' => 11 })

  film1.save()

  film2 = Film.new({
    'title' => 'Rocky 3',
    'price' => 14 })

  film2.save()

  film3 = Film.new({
    'title' => 'Heat',
    'price' => 12 })

  film3.save()

  film4 = Film.new({
    'title' => 'Star Wars',
    'price' => 10 })

  film4.save()


  customer1 = Customer.new({
    'name' => 'John',
    'funds' => 101 })
  customer1.save()

  customer2 = Customer.new({
    'name' => 'Eugene',
    'funds' => 25 })
  customer2.save()

  customer3 = Customer.new({
    'name' => 'Zolt',
    'funds' => 250 })
  customer3.save()

  customer4 = Customer.new({
    'name' => 'Louise',
    'funds' => 90 })
  customer4.save()

  customer5 = Customer.new({
    'name' => 'Buba',
    'funds' => 40 })
  customer5.save()

  ticket1 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id })
  ticket2 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id })
  ticket3 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id })
  ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id })
  ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film1.id })
  ticket6 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film1.id })
  ticket7 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film4.id })
  ticket8 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film4.id })

  ticket1.save()
  ticket2.save()
  ticket3.save()
  ticket4.save()
  ticket5.save()
  ticket6.save()
  ticket7.save()
  ticket8.save()

  binding.pry
  nil
