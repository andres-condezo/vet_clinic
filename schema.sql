/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  PRIMARY KEY(id)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(250);

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(250),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  PRIMARY KEY(id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT constraint_species
FOREIGN KEY (species_id)
REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT constraint_owner
FOREIGN KEY (owner_id)
REFERENCES owners;

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    vet_id INT,
    species_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id),
    PRIMARY KEY(vet_id, species_id)
);

CREATE TABLE visits(
    id INT GENERATED ALWAYS AS IDENTITY,
    animals_id INT,
    vet_id INT,
    date_of_visit DATE,
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (animals_id) REFERENCES animals(id),
    PRIMARY KEY(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_visits_idx ON visits(animal_id);

CREATE INDEX vets_visits_idx ON visits(vet_id);
