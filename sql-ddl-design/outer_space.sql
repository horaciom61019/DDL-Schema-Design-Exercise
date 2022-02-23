-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INTEGER REFERENCES stars (id),
  galaxy_id INTEGER REFERENCES galaxies (id),
  moons TEXT[]
);


INSERT INTO galaxies
  (name)
VALUES ('Milky Way');

INSERT INTO stars
  (name)
VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, star_id, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 1, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('00', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 2, 1, '{}'),
  ('Gliese 876 b', 0.23, 3, 1, '{}')
;



-- -- -- --   Original Data Table   -- -- -- --

-- -[ RECORD 1 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- id                      | 1
-- name                    | Earth
-- orbital_period_in_years | 1
-- orbits_around           | The Sun
-- galaxy                  | Milky Way
-- moons                   | {"The Moon"}
-- -[ RECORD 2 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- id                      | 2
-- name                    | Mars
-- orbital_period_in_years | 1.88
-- orbits_around           | The Sun
-- galaxy                  | Milky Way
-- moons                   | {Phobos,Deimos}
-- -[ RECORD 3 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- id                      | 3
-- name                    | Venus
-- orbital_period_in_years | 0.62
-- orbits_around           | The Sun
-- galaxy                  | Milky Way
-- moons                   | {}
-- -[ RECORD 4 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- id                      | 4
-- name                    | Neptune
-- orbital_period_in_years | 164.8
-- orbits_around           | The Sun
-- galaxy                  | Milky Way
-- moons                   | {Naiad,Thalassa,Despina,Galatea,Larissa,"S/2004 N 1",Proteus,Triton,Nereid,Halimede,Sao,Laomedeia,Psamathe,Neso}
-- -[ RECORD 5 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- id                      | 5
-- name                    | Proxima Centauri b
-- orbital_period_in_years | 0.03
-- orbits_around           | Proxima Centauri
-- galaxy                  | Milky Way
-- moons                   | {}
-- -[ RECORD 6 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- id                      | 6
-- name                    | Gliese 876 b
-- orbital_period_in_years | 0.23
-- orbits_around           | Gliese 876
-- galaxy                  | Milky Way
-- moons                   | {}

-- SQL commands
SELECT p.name, orbital_period_in_years, s.name, g.name, moons 
FROM planets p 
JOIN stars s ON p.star_id=s.id
JOIN galaxies g ON p.galaxy_id=g.id;


-- -- -- --   Final Data Table   -- -- -- --
-- -[ RECORD 1 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- name                    | Earth
-- orbital_period_in_years | 1
-- name                    | The Sun
-- name                    | Milky Way
-- moons                   | {"The Moon"}
-- -[ RECORD 2 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- name                    | Mars
-- orbital_period_in_years | 1.88
-- name                    | The Sun
-- name                    | Milky Way
-- moons                   | {Phobos,Deimos}
-- -[ RECORD 3 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- name                    | Venus
-- orbital_period_in_years | 0.62
-- name                    | The Sun
-- name                    | Milky Way
-- moons                   | {}
-- -[ RECORD 4 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- name                    | 00
-- orbital_period_in_years | 164.8
-- name                    | The Sun
-- name                    | Milky Way
-- moons                   | {Naiad,Thalassa,Despina,Galatea,Larissa,"S/2004 N 1",Proteus,Triton,Nereid,Halimede,Sao,Laomedeia,Psamathe,Neso}
-- -[ RECORD 5 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- name                    | Proxima Centauri b
-- orbital_period_in_years | 0.03
-- name                    | Proxima Centauri
-- name                    | Milky Way
-- moons                   | {}
-- -[ RECORD 6 ]-----------+-----------------------------------------------------------------------------------------------------------------
-- name                    | Gliese 876 b
-- orbital_period_in_years | 0.23
-- name                    | Gliese 876
-- name                    | Milky Way
-- moons                   | {}