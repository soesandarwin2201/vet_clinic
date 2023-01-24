/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon','2020-02-03',0,true,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Gabumon','2018-11-15',2,true,8.0);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Pikachu','2021-01-07',1,false,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Devimon','2020-05-12',5,true,11.0);


INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Charmander',date '2020-02-08',0,false,-11);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Plantmon',date '2021-11-15',2,true,-5.7);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Squirtle',date '1993-04-02',3,false,-12.13);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Angemon',date '2005-06-12',1,true,-45);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Boarmon',date '2005-06-07',7,true,20.4);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Blossom',date '1998-10-13',3,true,17);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Ditto',date '2022-05-12',4,true,22);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34);
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell',19);
INSERT INTO owners (full_name,age) VALUES ('Bob',45);
INSERT INTO owners (full_name,age) VALUES ('Melody Pond',77);
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester',14);
INSERT INTO owners (full_name,age) VALUES ('Jodie Whittaker',38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2  WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1  WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
INSERT INTO vets(name,age,date_of_graduation)
VALUES('Wlliam',45,'2000-04-23');
INSERT INTO vets(name,age,date_of_graduation)
VALUES('Maisy Smith',26,'2019-06-17');
INSERT INTO vets(name,age,date_of_graduation)
VALUES('Stephanie Mendex',64,'1981-05-04');
INSERT INTO vets(name,age,date_of_graduation)
VALUES('Jack Harkness',38,'2008-06-08');

INSERT INTO specializations(species_id, vets_id) VALUES
  (1, 1),
  (1, 3),
  (2, 3),
  (2, 4);

INSERT INTO visits(animals_id,vets_id, date_of_visit) VALUES
    (1, 1, '2020-05-24'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (3, 2, '2020-01-05'),
    (3, 2, '2020-03-08'),
    (3, 2, '2020-05-14'),
    (4, 3, '2021-05-04'),
    (5, 4, '2021-02-24'),
    (6, 2, '2019-12-21'),
    (6, 1, '2020-08-10'),
    (6, 2, '2021-04-07'),
    (7, 3, '2019-09-29'),
    (8, 4, '2020-10-03'),
    (8, 4, '2020-11-04'),
    (9, 2, '2019-01-24'),
    (9, 2, '2019-05-15'),
    (9, 2, '2020-02-27'),
    (9, 2, '2020-08-03'),
    (10, 3, '2020-05-24'),
    (10, 1, '2021-01-11');

