DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

-- customers are last on this list above as it is the ticket and film that binds these together.

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE
);


-- I need two tabs in Terminal one for PSQL db name in this case cinema (psql cinema) and then you can call functions and get tables (select * from tickets;) and you need the PRY open as well which is (psql -d cinema -f db/cinema.sql) and then (ruby console.rb)
