/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_date;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO delete_date;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered,MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-12-31' AND '2000-12-31' GROUP BY species;

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 4 WHERE name IN ('Angemon','Boarmon');

SELECT animals.name
FROM animals
JOIN owners ON owners.id = animals.owner_id 
WHERE owners.full_name = 'Melody Pond';
SELECT animals.name
FROM animals
JOIN species ON species.id = animals.species_id 
WHERE species.name = 'Pokemon';
SELECT owners.full_name ,animals.name
FROM owners
RIGHT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(*)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY (species.name);
SELECT owners.full_name, animals.name, species.name
FROM animals
JOIN owners ON owners.id = animals.owner_id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT owners.full_name, animals.name, animals.escape_attempts
FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals.name)
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY (owners.full_name) 
ORDER BY count DESC
LIMIT 1;

explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';
SELECT animals.name,vets.name,visits.date_of_visit FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id=visits.animals_id WHERE vets.name = 'Wlliam' ORDER BY date_of_visit desc LIMIT 1;

SELECT COUNT(*) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendex';

SELECT vets.name,species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id = specializations.species_id;
SELECT animals.name,vets.name,visits.date_of_visit FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Stephanie Mendex' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

select animals.name, count(*) as number_of_visits from visits join animals on visits.animals_id = animals.id group by animals.name order by number_of_visits desc limit 1;
SELECT animals.name,vets.name,visits.date_of_visit FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Maisy Smith'ORDER BY date_of_visit limit 1;

select animals.name as animal, animals.date_of_birth as animal_birthday, animals.escape_attempts, animals.neutered, animals.weight_kg, owners.full_name as owner, species.name as species, vets.name as vet, vets.age, vets.date_of_graduation, visits.date_of_visit from visits join animals on visits.animals_id = animals.id join owners on animals.owner_id = owners.id join species on animals.species_id = species.id join vets on visits.vets_id = vets.id order by date_of_visit desc limit 1;

SELECT COUNT(vets.name) FROM visits INNER JOIN vets ON visits.vets_id = vets.id WHERE vets.name = (SELECT vets.name FROM specializations RIGHT JOIN vets ON specializations.vets_id =vets.id
WHERE specializations.species_id is NULL);

SELECT species.name FROM species JOIN animals ON animals.species_id = species.id JOIN visits ON visits.animals_id = animals.id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY count(species.name) DESC LIMIT 1;

