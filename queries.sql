/*Queries that provide answers to the questions from all projects.*/

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
FROM animals
WHERE name LIKE '%mon';

SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name
FROM animals
WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name
FROM animals
WHERE weight_kg > 10.5;

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
FROM animals
WHERE neutered = TRUE;

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
FROM animals
WHERE name != 'Gabumon';

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';

SELECT species
FROM animals;

ROLLBACK;

SELECT species
FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

SELECT species
FROM animals;

BEGIN;
DELETE
FROM animals;

SELECT COUNT(*)
FROM animals;

ROLLBACK;

SELECT COUNT(*)
FROM animals;

BEGIN;
DELETE
FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*)
FROM animals;

SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT
    neutered,
    MAX(escape_attempts) AS escapes_attempts
FROM animals
GROUP BY neutered;

SELECT
    species,
    MIN(weight_kg) AS min_weight_kg,
    MAX(weight_kg) AS max_weight_kg
FROM animals
GROUP BY species;

SELECT
    species,
    AVG(escape_attempts) AS escapes_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT
    owners.full_name AS owners,
    animals.name AS animals
FROM owners
INNER JOIN animals
    ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT
    animals.name AS animals,
    species.name AS species
FROM animals
INNER JOIN species
    ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT
    owners.full_name AS owners,
    animals.name AS animals
FROM owners
LEFT JOIN animals
    ON owners.id = animals.owner_id;

SELECT
    species.name,
    COUNT(animals.name) AS total
FROM species
INNER JOIN animals
    ON species.id = animals.species_id
GROUP BY species.name;

SELECT
    owners.full_name AS owners,
    animals.name AS digimons
FROM owners
INNER JOIN animals
    ON owners.id = animals.owner_id
INNER JOIN species
    ON species.id = animals.species_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT
    owners.full_name AS owners,
    animals.name AS animals
FROM owners
INNER JOIN animals
    ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT
    owners.full_name AS owners,
    COUNT(animals.owner_id) AS animals
FROM owners
INNER JOIN animals
    ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animals DESC LIMIT 1;

SELECT
    animals.name AS animals,
    visits.date_of_visit AS visit
FROM animals
INNER JOIN visits
    ON animals.id = visits.animals_id
INNER JOIN vets
    ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT
    vets.name AS vet,
    COUNT(animals.name) AS types
FROM animals
INNER JOIN visits
    ON animals.id = visits.animals_id
INNER JOIN vets
    ON vets.id = visits.vet_id
WHERE visits.vet_id = 3
GROUP BY vets.name;

SELECT
    vets.name AS vet,
    species.name AS specialties
FROM vets
LEFT JOIN specializations
    ON vets.id = specializations.vet_id
LEFT JOIN species
    ON species.id = specializations.species_id;

SELECT
    vets.name AS vet,
    animals.name AS animals,
    visits.date_of_visit AS visits
FROM animals
INNER JOIN visits
    ON animals.id = visits.animals_id
INNER JOIN vets
    ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
    AND (visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30');

SELECT
    animals.name,
    COUNT(animals.name) AS visits
FROM animals
INNER JOIN visits
    ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT(animals.name) DESC LIMIT 1;

SELECT
    animals.name AS animals,
    vets.name AS vet,
    visits.date_of_visit AS visits
FROM animals
INNER JOIN visits
    ON animals.id = visits.animals_id
INNER JOIN vets
    ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT
    animals.id AS animal_id,
    animals.name AS animal_name,
    vets.id AS vet_id,
    vets.name AS vet_name,
    visits.date_of_visit AS date_of_visits
FROM animals
INNER JOIN visits
    ON animals.id = visits.animals_id
INNER JOIN vets
    ON vets.id = visits.vet_id
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(visits.id) AS visits
FROM vets
INNER JOIN visits
    ON vets.id = visits.animals_id
LEFT JOIN specializations
    ON specializations.species_id = vets.id
LEFT JOIN species
    ON species.id = specializations.species_id
WHERE specializations.species_id IS NULL;

SELECT
    species.name,
    COUNT(*) AS visits
FROM animals
INNER JOIN species
    ON animals.species_id = animals.species_id
INNER JOIN visits
    ON animals.id = visits.animals_id
INNER JOIN vets
    ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name LIMIT 1;
