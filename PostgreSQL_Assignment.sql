-- Active: 1747447723202@@127.0.0.1@5432@conservation_db
--new database create
CREATE DATABASE conservation_db;

--Create table
create table rangers (
  ranger_id serial PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  region VARCHAR(50) DEFAULT 'No Region Provided'
);

create table species(
  species_id serial PRIMARY KEY,
  common_name VARCHAR(50) NOT NULL,
  scientific_name VARCHAR(50) NOT NULL,
  discovery_date DATE NOT NULL,
  conservation_status VARCHAR(30) NOT NULL CHECK (
    conservation_status IN ('Vulnerable', 'Endangered')
)
);

create table sightings(
  sighting_id serial PRIMARY KEY,
  ranger_id INT REFERENCES rangers(ranger_id),
  species_id INT REFERENCES species(species_id),
  sighting_time DATE NOT NULL,
  location VARCHAR(100) NOT NULL,
  notes TEXT
);

--Insert data into rangers table
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'Central Plains'),
('Charlie Black', 'River Delta'),
('Diana Blue', 'Eastern Forests'),
('Ethan Gray', 'Western Mountains'),
('Carol King','Mountain Range');

--Insert data into species table
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Northern Lynx', 'Lynx canadensis', '2000-05-15', 'Vulnerable'),
('Eastern Wolf', 'Canis lupus lycaon', '1998-08-20', 'Endangered'),
('Mountain Goat', 'Oreamnos americanus', '2005-03-10', 'Vulnerable'),
('Red Fox', 'Vulpes vulpes', '2010-07-25', 'Vulnerable'),
('Bald Eagle', 'Haliaeetus leucocephalus', '1985-11-30', 'Endangered'),
(' Snow Leopard ', 'Panthera uncia', '1775-02-14', 'Endangered'),
('Grizzly Bear', 'Ursus arctos horribilis', '1825-09-05', 'Vulnerable'),
('American Bison', 'Bison bison', '1780-04-18', 'Endangered');

--Insert data into sightings table
INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(3, 4, '2024-05-18 18:30:00 ', 'Peak Ridge', 'Spotted near the riverbank'),
(1, 2, '2024-05-18 18:30:00', 'Bankwood Area', 'Observed during a patrol'),
(4, 3, '2024-05-18 18:30:00', 'Bamboo Grove East', 'Seen grazing in the meadow'),
(3, 2, '2024-05-18 18:30:00', 'Snowfall Pass', 'Noted for its vibrant fur color'),
(1, 4, '2024-05-18 18:30:00', 'Western Mountains', NULL),
(6, 3, '2024-05-18 18:30:00', 'Mountain Range', 'Rare sighting in this area'),
(2, 1, '2024-05-18 18:30:00', 'Central Plains', 'Observed during a routine check'),
(3, 5, '2024-05-18 18:30:00', 'Northern Hills', NULL),
(2, 6, '2024-05-18 18:30:00', 'River Delta Pass', NULL),
(4, 7, '2024-05-18 18:30:00', 'Eastern Forests', NULL),
(3, 8, '2024-05-18 18:30:00', 'Western Mountains Pass', 'Observed during a routine check');

