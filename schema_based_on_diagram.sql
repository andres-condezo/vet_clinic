CREATE DATABASE clinic;

CREATE TABLE patients(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(150) NOT NULL,
  date_of_birth DATE NOT NULL
);

