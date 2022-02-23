/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id              INT PRIMARY  KEY     NOT NULL,
   name            CHAR(50)    NOT NULL,
   date_of_birth   DATE     NOT NULL,
   escape_attempts INT,
   neutered        BOOLEAN,
   weight_kg       DECIMAL
);

ALTER TABLE animals
ADD COLUMN species CHAR(50);
