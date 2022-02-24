/*Queries that provide answers to the questions from all projects.*/

/*part 1*/
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';
SELECT name FROM animals WHERE escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*part 2*/

/*---*/
BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

/*---*/
BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';

UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon%';

COMMIT;

/*---*/
BEGIN;

DELETE FROM animals;
ROLLBACK;

/*---*/
BEGIN;

DELETE FROM animals
WHERE date_of_birth BETWEEN '2022-1-1' AND '3000-1-1';

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = -weight_kg;

ROLLBACK TO SP1;

UPDATE animals
SET weight_kg = -weight_kg
WHERE weight_kg < 0;

COMMIT;

/*---*/
SELECT COUNT(*) FROM animals;

SELECT COUNT(name) FROM animals WHERE escape_attempts > 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-1-1' GROUP BY species;
