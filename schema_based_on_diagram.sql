CREATE DATABASE clinic;

CREATE TABLE patients(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(150) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY NOT NULL,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INTEGER NOT NULL,
    status VARCHAR(150) NOT NULL,
    CONSTRAINT constraint_patient
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments(
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(150) NOT NULL,
    name VARCHAR(150) NOT NULL,
);

CREATE TABLE medical_histories_treatment(
    id SERIAL PRIMARY KEY NOT NULL,
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatments_id) REFERENCES treatments(id),
);
