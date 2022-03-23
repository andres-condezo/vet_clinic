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

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg,
    species
FROM animals;

ROLLBACK;

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg,
    species
FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg,
    species
FROM animals;

BEGIN;
DELETE
FROM animals;

ROLLBACK;

SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg,
    species
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
