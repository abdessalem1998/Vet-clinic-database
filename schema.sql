/* Database schema to keep the structure of entire database. */
/*Part 1 */
CREATE TABLE animals(
   id              INT PRIMARY  KEY     NOT NULL,
   name            CHAR(50)    NOT NULL,
   date_of_birth   DATE     NOT NULL,
   escape_attempts INT,
   neutered        BOOLEAN,
   weight_kg       DECIMAL
);

/*Part 2 */
ALTER TABLE animals
ADD COLUMN species CHAR(50);

/*Part 3 */
CREATE TABLE owners (
   id              INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
   full_name       CHAR(100)    NOT NULL,
   age             INT
);

/*---*/
CREATE TABLE species (
   id              INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
   name            CHAR(100)    NOT NULL
);

ALTER TABLE animals
DROP COLUMN species;

/*---*/
ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
   ADD FOREIGN KEY (species_id) REFERENCES species (id);

/*---*/
ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
   ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

/*Part 4 */
/*---*/
CREATE TABLE vets (
   id                   INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
   name                 CHAR(100)    NOT NULL,
   age                  INT,
   date_of_graduation   DATE
);

CREATE TABLE specializations (
	vets_id    int NOT NULL,
	species_id int NOT NULL,
	FOREIGN KEY (vets_id)    REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (vets_id, species_id)
);

CREATE TABLE visits (
  id           INT GENERATED BY DEFAULT AS IDENTITY,
	animal_id    int NOT NULL,
	vet_id       int NOT NULL,
  visit_date   DATE,
	FOREIGN KEY (animal_id)    REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE
);
