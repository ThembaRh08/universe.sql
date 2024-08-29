psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    type VARCHAR(30),
    distance_from_earth NUMERIC,
    has_life BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL
);

-- Create galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    type VARCHAR(30),
    distance_from_earth NUMERIC,
    has_life BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL
);

-- Create star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    type VARCHAR(30),
    size INT,
    is_visible BOOLEAN NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

-- Create planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    type VARCHAR(30),
    has_rings BOOLEAN NOT NULL,
    distance_from_sun NUMERIC,
    star_id INT REFERENCES star(star_id)
);

-- Create moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    orbit_period INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    planet_id INT REFERENCES planet(planet_id)
);

-- Create celestial_object table
CREATE TABLE celestial_object (
    celestial_object_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    mass NUMERIC,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

-- Insert data into galaxy table
INSERT INTO galaxy (name, type, distance_from_earth, has_life, age_in_millions_of_years) VALUES
('Milky Way', 'Spiral', 0, TRUE, 13600),
('Andromeda', 'Spiral', 2537000, FALSE, 10000),
('Triangulum', 'Spiral', 3000000, FALSE, 13000),
('Whirlpool', 'Spiral', 23000000, FALSE, 2000),
('Sombrero', 'Elliptical', 29000000, FALSE, 6000),
('Large Magellanic Cloud', 'Irregular', 163000, FALSE, 10000);

-- Insert data into star table
INSERT INTO star (name, type, size, is_visible, galaxy_id) VALUES
('Sun', 'G-type Main-Sequence', 1, TRUE, 1),
('Sirius', 'A-type Main-Sequence', 2, TRUE, 2),
('Alpha Centauri A', 'G-type Main-Sequence', 1, TRUE, 1),
('Alpha Centauri B', 'K-type Main-Sequence', 1, TRUE, 1),
('Betelgeuse', 'Red Supergiant', 1200, TRUE, 3),
('Rigel', 'Blue Supergiant', 79, TRUE, 4);

-- Insert data into planet table
INSERT INTO planet (name, type, has_rings, distance_from_sun, star_id) VALUES
('Mercury', 'Terrestrial', FALSE, 57.9, 1),
('Venus', 'Terrestrial', FALSE, 108.2, 1),
('Earth', 'Terrestrial', FALSE, 149.6, 1),
('Mars', 'Terrestrial', FALSE, 227.9, 1),
('Jupiter', 'Gas Giant', TRUE, 778.3, 1),
('Saturn', 'Gas Giant', TRUE, 1427.0, 1),
('Uranus', 'Ice Giant', TRUE, 2871.0, 1),
('Neptune', 'Ice Giant', TRUE, 4497.1, 1),
('Proxima b', 'Terrestrial', FALSE, 4.22, 2),
('Kepler-452b', 'Super-Earth', FALSE, 1400, 2),
('Gliese 581g', 'Super-Earth', FALSE, 20.3, 3),
('HD 209458 b', 'Hot Jupiter', FALSE, 153, 4);

-- Insert data into moon table
INSERT INTO moon (name, orbit_period, is_spherical, planet_id) VALUES
('Moon', 27, TRUE, 3),
('Phobos', 0.3, TRUE, 4),
('Deimos', 1.3, TRUE, 4),
('Europa', 3.5, TRUE, 5),
('Ganymede', 7.1, TRUE, 5),
('Callisto', 16.7, TRUE, 5),
('Io', 1.8, TRUE, 5),
('Titan', 16, TRUE, 6),
('Rhea', 4.5, TRUE, 6),
('Iapetus', 79.3, TRUE, 6),
('Triton', 5.9, TRUE, 8),
('Nereid', 360.1, TRUE, 8),
('Miranda', 1.4, TRUE, 7),
('Ariel', 2.5, TRUE, 7),
('Umbriel', 4.1, TRUE, 7),
('Titania', 8.7, TRUE, 7),
('Oberon', 13.5, TRUE, 7),
('Charon', 6.4, TRUE, 9),
('Nix', 24.9, TRUE, 9),
('Hydra', 38.2, TRUE, 9);

-- Insert data into celestial_object table
INSERT INTO celestial_object (name, description, mass, galaxy_id) VALUES
('Black Hole', 'A region of spacetime where gravity is so strong that nothing can escape from it', 4.3e6, 1),
('Pulsar', 'A highly magnetized rotating neutron star that emits beams of electromagnetic radiation', 1.4, 2),
('Quasar', 'A massive and extremely remote celestial object, emitting exceptionally large amounts of energy', 2.0, 3);

