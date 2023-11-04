/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-2-3', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-1-7', 1, false, 15.04),
('Devimon', '2017-5-12', 5, true, 11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11),
       ('Plantmon', '2021-11-15', 2, true, -5.7),
       ('Squirtle', '1993-04-02', 3, false, -12.13),
	   ('Angemon', '2005-06-12', 1, true, -45),
	   ('Boarmon', '2005-06-07', 7, true, 20.4),
	   ('Blossom', '1998-10-13', 3, true, 17),
	   ('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
		('Jennifer Orwell', 19),
		('Bob', 45),
		('Melody Pond', 77),
		('Dean Winchester', 14),
		('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokeman'),
	   ('Digimon');

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals
SET species_id = 2
WHERE name Like '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

UPDATE species 
SET name = 'Pokemon'
WHERE id = 1;

INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vets_id) VALUES
(1, 1),
(2, 3),
(1, 3),
(2, 4);

INSERT INTO visits (animals_id, vets_id, visit_date) VALUES
(12, 1, '2020-05-24'),
(12, 3, '2020-07-22'),
(13, 4, '2021-02-02'),
(14, 2, '2020-01-05'),
(14, 2, '2020-03-08'),
(14, 2, '2020-04-14'),
(15, 3, '2021-05-04'),
(16, 4, '2021-02-24'),
(17, 2, '2019-12-21'),
(17, 1, '2020-08-10'),
(17, 2, '2021-04-07'),
(18, 3, '2019-09-29'),
(19, 4, '2020-08-03'),
(19, 4, '2020-11-04'),
(20, 2, '2019-01-24'),
(20, 2, '2019-05-15'),
(20, 2, '2020-02-27'),
(20, 2, '2020-08-03'),
(21, 3, '2020-05-24'),
(21, 1, '2021-01-11');