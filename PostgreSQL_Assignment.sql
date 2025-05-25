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
    conservation_status IN ('Vulnerable', 'Endangered','Historic')
)
);

create table sightings(
  sighting_id serial PRIMARY KEY,
  ranger_id INT REFERENCES rangers(ranger_id),
  species_id INT REFERENCES species(species_id),
  sighting_time TIMESTAMP NOT NULL,
  location VARCHAR(100) NOT NULL,
  notes TEXT
);

--Insert data into rangers table
INSERT INTO rangers (name, region) VALUES

--Insert data into species table
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES

--Insert data into sightings table data
INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES


--Provlem 1: Register a new ranger
INSERT INTO rangers (name, region) VALUES
('Derek Fox','Coastal Plains');

--Problem 2: Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

--Problem 3: Find all sightings where the location includes "Pass".
SELECT * FROM sightings
WHERE location ILIKE '%Pass%';

--Problem 4: List each ranger's name and their total number of sightings
SELECT name,count(*)as total_sightings FROM sightings INNER JOIN rangers USING(ranger_id) GROUP BY name;

--Problem 5: List species that have never been sighted.
SELECT common_name FROM sightings RIGHT JOIN species USING(species_id) WHERE sightings.sighting_id IS NULL;

--Problem 6: Show the most recent 2 sightings.
SELECT common_name,sighting_time,name FROM sightings JOIN species USING(species_id) JOIN  rangers USING(ranger_id) ORDER BY sighting_time DESC LIMIT 2;

--Problem 7: Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species SET conservation_status='Historic' WHERE extract(year from discovery_date) < 1800;

--Problem 8: Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
select sighting_id, CASE
  WHEN extract(hour from sighting_time) <12 THEN 'Morning'
 WHEN extract(hour from sighting_time) <17 THEN 'Afternoon'
  ELSE 'Evening'
END
as time_of_day,sighting_time from sightings;

--Problem 9: Delete rangers who have never sighted any species
DELETE FROM rangers WHERE rangers.ranger_id NOT IN(SELECT DISTINCT ranger_id from sightings);
