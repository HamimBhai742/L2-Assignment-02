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
('Charlie Black', 'Southern Woods'),
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
