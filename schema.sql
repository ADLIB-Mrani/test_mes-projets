-- Schéma PostgreSQL pour le portfolio BUT SD

CREATE TABLE student (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  university VARCHAR(180) NOT NULL,
  program VARCHAR(120) NOT NULL,
  current_year SMALLINT NOT NULL CHECK (current_year BETWEEN 1 AND 3)
);

CREATE TABLE competence (
  code CHAR(2) PRIMARY KEY,
  title VARCHAR(160) NOT NULL UNIQUE
);

CREATE TABLE technical_skill (
  id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  category VARCHAR(50) NOT NULL
);

CREATE TABLE project (
  id SERIAL PRIMARY KEY,
  student_id INTEGER NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  title VARCHAR(180) NOT NULL,
  period_label VARCHAR(80) NOT NULL,
  total_hours NUMERIC(5,2) NOT NULL CHECK (total_hours >= 0),
  description TEXT
);

CREATE TABLE project_competence (
  project_id INTEGER NOT NULL REFERENCES project(id) ON DELETE CASCADE,
  competence_code CHAR(2) NOT NULL REFERENCES competence(code),
  hours NUMERIC(5,2) NOT NULL CHECK (hours >= 0),
  PRIMARY KEY (project_id, competence_code)
);

CREATE TABLE project_skill (
  project_id INTEGER NOT NULL REFERENCES project(id) ON DELETE CASCADE,
  skill_id INTEGER NOT NULL REFERENCES technical_skill(id),
  PRIMARY KEY (project_id, skill_id)
);

CREATE TABLE alternance_mission (
  id SERIAL PRIMARY KEY,
  student_id INTEGER NOT NULL REFERENCES student(id) ON DELETE CASCADE,
  organization VARCHAR(180) NOT NULL,
  title VARCHAR(160) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  description TEXT
);

INSERT INTO competence(code, title) VALUES
('C1', 'Traiter des données à des fins décisionnelles'),
('C2', 'Analyser statistiquement les données'),
('C3', 'Valoriser une production dans un contexte professionnel'),
('C4', 'Développer un outil décisionnel');
