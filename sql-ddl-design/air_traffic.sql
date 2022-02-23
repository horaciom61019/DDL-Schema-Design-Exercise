-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines (id),
  from_city_id INTEGER REFERENCES cities (id),
  from_country_id INTEGER REFERENCES countries (id),
  to_city_id INTEGER REFERENCES cities (id),
  to_country_id INTEGER REFERENCES countries (id)
);


INSERT INTO airlines
  (airline)
VALUES
  ('Air China'), ('American Airlines'), ('Avianca Brasil'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('United');

INSERT INTO cities
  (city)
VALUES
  ('Cedar Rapids'), ('Charlotte'), ('Dubai'), ('Los Angeles'), ('New York'), ('Paris'), ('Sao Paolo'), ('Seattle'), ('Tokyo'), ('Washington DC'),
  ('Beijing'), ('Casablanca'), ('Chicago'), ('Las Vegas'), ('London'), ('Mexico City'), ('New Orleans'), ('Santiago');

INSERT INTO countries
  (country)
VALUES
  ('Chile'), ('China'), ('Mexico'), ('Morocco'), ('Brazil'), ('UAE'), ('United States'), ('France'), ('United Kingdom'), ('Japan');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 7, 10, 7, 8, 7),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 4, 9, 10, 15, 9),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 4, 7, 14, 7),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 5, 8, 7, 16, 3),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 6, 6, 8, 12, 4),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 1, 3, 6, 11, 2),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 5, 7, 2, 7),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 2, 1, 7, 13, 7),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 2, 2, 7, 17, 7),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 3, 7, 5, 18, 1);


-- -- -- --   Original Data Table   -- -- -- --
--  id | first_name | last_name  | seat |      departure      |       arrival       |      airline      |   from_city   | from_country  |   to_city   |   to_country   
-- ----+------------+------------+------+---------------------+---------------------+-------------------+---------------+---------------+-------------+----------------
--   1 | Jennifer   | Finch      | 33B  | 2018-04-08 09:00:00 | 2018-04-08 12:00:00 | United            | Washington DC | United States | Seattle     | United States
--   2 | Thadeus    | Gathercoal | 8A   | 2018-12-19 12:45:00 | 2018-12-19 16:15:00 | British Airways   | Tokyo         | Japan         | London      | United Kingdom
--   3 | Sonja      | Pauley     | 12F  | 2018-01-02 07:00:00 | 2018-01-02 08:03:00 | Delta             | Los Angeles   | United States | Las Vegas   | United States
--   4 | Jennifer   | Finch      | 20A  | 2018-04-15 16:50:00 | 2018-04-15 21:00:00 | Delta             | Seattle       | United States | Mexico City | Mexico
--   5 | Waneta     | Skeleton   | 23D  | 2018-08-01 18:30:00 | 2018-08-01 21:50:00 | TUI Fly Belgium   | Paris         | France        | Casablanca  | Morocco
--   6 | Thadeus    | Gathercoal | 18C  | 2018-10-31 01:15:00 | 2018-10-31 12:55:00 | Air China         | Dubai         | UAE           | Beijing     | China
--   7 | Berkie     | Wycliff    | 9E   | 2019-02-06 06:00:00 | 2019-02-06 07:47:00 | United            | New York      | United States | Charlotte   | United States
--   8 | Alvin      | Leathes    | 1A   | 2018-12-22 14:42:00 | 2018-12-22 15:56:00 | American Airlines | Cedar Rapids  | United States | Chicago     | United States
--   9 | Berkie     | Wycliff    | 32B  | 2019-02-06 16:28:00 | 2019-02-06 19:18:00 | American Airlines | Charlotte     | United States | New Orleans | United States
--  10 | Cory       | Squibbes   | 10D  | 2019-01-20 19:30:00 | 2019-01-20 22:45:00 | Avianca Brasil    | Sao Paolo     | Brazil        | Santiago    | Chile
-- (10 rows)

