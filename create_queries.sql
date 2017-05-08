CREATE TABLE calander_dimension
(
  calander_key INTEGER NOT NULL,
  day_of_month INTEGER NOT NULL,
  the_month INTEGER NOT NULL,
  the_quarter INTEGER NOT NULL,
  the_year INTEGER NOT NULL,
  PRIMARY KEY (calander_key)
);

CREATE TABLE location_dimension
(
  location_key INTEGER NOT NULL,
  location_state VARCHAR NOT NULL,
  PRIMARY KEY (location_key)
);

CREATE TABLE age_dimension
(
  age_key INTEGER NOT NULL,
  the_age INTEGER NOT NULL,
  PRIMARY KEY (age_key)
);

CREATE TABLE disease_dimension
(
  disease_key INTEGER NOT NULL,
  the_disease VARCHAR NOT NULL,
  PRIMARY KEY (disease_key)
);

CREATE TABLE insurance_dimension
(
  insurance_key INTEGER NOT NULL,
  the_insurance VARCHAR(500) NOT NULL,
  the_max_coverage INTEGER NOT NULL,
  PRIMARY KEY (insurance_key)
);

CREATE TABLE patients_fact
(
  number_of_patients INTEGER NOT NULL,
  dollars_expenses INTEGER NOT NULL,
  average_bmi INTEGER NOT NULL,
  calander_key INTEGER NOT NULL,
  age_key INTEGER NOT NULL,
  disease_key INTEGER NOT NULL,
  location_key INTEGER NOT NULL,
  FOREIGN KEY (calander_key) REFERENCES calander_dimension(calander_key),
  FOREIGN KEY (age_key) REFERENCES age_dimension(age_key),
  FOREIGN KEY (disease_key) REFERENCES disease_dimension(disease_key),
  FOREIGN KEY (location_key) REFERENCES location_dimension(location_key)
);

CREATE TABLE insurance_fact
(
  number_of_insurances INTEGER NOT NULL,
  calander_key INTEGER NOT NULL,
  age_key INTEGER NOT NULL,
  disease_key INTEGER NOT NULL,
  insurance_key INTEGER NOT NULL,
  FOREIGN KEY (calander_key) REFERENCES calander_dimension(calander_key),
  FOREIGN KEY (age_key) REFERENCES age_dimension(age_key),
  FOREIGN KEY (disease_key) REFERENCES disease_dimension(disease_key),
  FOREIGN KEY (insurance_key) REFERENCES insurance_dimension(insurance_key)
);
