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
