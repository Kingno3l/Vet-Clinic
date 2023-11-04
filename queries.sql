/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN  10.4 AND 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
UPDATE animals
SET species = 'pokemon'
WHERE species IS null;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT save_one;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO save_one;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT (id) FROM animals;
SELECT COUNT (escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' 
GROUP BY species;


SELECT name, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name as animal, species.name as species
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT full_name as owner, name as animal
FROM animals
FULL JOIN owners
ON animals.owner_id = owners.id;

SELECT species.name as species, Count(animals.name) as counted
FROM animals
JOIN species
ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name as animals, species.name as species, full_name as owner
FROM animals
JOIN species
ON animals.species_id = species.id
JOIN owners
ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';

SELECT name as animal, escape_attempts, full_name as owner
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT full_name as owner, Count(name) as count_of_animals
FROM animals
JOIN owners
ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY count_of_animals Desc;

SELECT animals.name, vets.name as seen_by, visit_date
FROM animals
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY visit_date Desc;

SELECT species.name, Count(animals.name) as count_of_species, vets.name as seen_by
FROM species
JOIN animals
ON animals.species_id = species.id
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY species.name, vets.name;

SELECT vets.name, vets.age, vets.date_of_graduation, species.name as specialization
FROM vets
FULL JOIN specializations
ON specializations.vets_id = vets.id
FULL JOIN species
ON species.id = specializations.species_id;

SELECT animals.name, vets.name as seen_by, visit_date
FROM animals
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez'
AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, Count(vets.name) as visit_count
FROM animals
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
GROUP BY animals.name
ORDER BY visit_count Desc;

SELECT animals.name, vets.name as seen_by, visit_date
FROM animals
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date;

SELECT animals.name as animal, animals.date_of_birth, animals.escape_attempts as escapes, 
animals.neutered, animals.weight_kg, vets.name as vet, vets.age, 
vets.date_of_graduation as graduated_on, visits.visit_date
FROM animals
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
ORDER BY visits.visit_date Desc;


SELECT species.name as species, Count(animals.name) as visit_count, vets.name as vet
FROM animals
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
LEFT JOIN specializations
ON specializations.vets_id = vets.id
AND specializations.species_id = animals.species_id
JOIN species
ON species.id = animals.species_id
WHERE specializations.species_id IS NULL
GROUP BY species.name, vets.name;

SELECT species.name as species, Count(animals.name) as visits, vets.name as vet
FROM animals
JOIN visits
ON visits.animals_id = animals.id
JOIN vets
ON vets.id = visits.vets_id
LEFT JOIN specializations
ON specializations.vets_id = vets.id
AND specializations.species_id = animals.species_id
JOIN species
ON species.id = animals.species_id
WHERE specializations.species_id IS NULL
AND vets.name = 'Maisy Smith'
GROUP BY species.name, vets.name;