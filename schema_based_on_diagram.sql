CREATE DATABASE IF NOT EXISTS clinic;

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
    name VARCHAR(150) NOT NULL
);

CREATE TABLE medical_histories_treatment(
    id SERIAL PRIMARY KEY NOT NULL,
    medical_histories_id INT,
    treatment_id INT,
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE invoices
(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	status VARCHAR(255),
	medical_history_id INT,
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE invoice_items
(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT,
	treatment_id INT,
	FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE INDEX medical_histories_patient_id_idx ON medical_histories(patient_id);

CREATE INDEX invoices_medical_history_id_idx ON invoices(medical_history_id);

CREATE INDEX invoice_items_invoice_id_idx ON invoice_items(invoice_id);

CREATE INDEX invoice_items_treatment_id_idx ON invoice_items(treatment_id);

CREATE INDEX medical_histories_treatment_medical_history_id_idx ON medical_histories_treatment(medical_histories_id);

CREATE INDEX medical_histories_treatment_treatment_id_idx ON medical_histories_treatment(treatment_id);
