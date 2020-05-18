--  Got this template from week 12 activity 14

DROP DATABASE IF EXISTS employee;
CREATE database employee;

USE employee;

CREATE TABLE employee_list (
  id INT NOT NULL,
  first_name VARCHAR(50) NULL,
  last_name VARCHAR(50) NULL,
  role_id INT NULL,
  manager_id VARCHAR(50) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE role (
id INT NOT NULL,
  title VARCHAR(50) NULL,
  salary DECIMAL,
  department_id INT,
  PRIMARY KEY (id)
  );
  
  CREATE TABLE department (
  department_id INT NOT NULL,
  dept_name VARCHAR(50) NULL,
  PRIMARY KEY (department_id)
  );

INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (1, 'Shenseea', 'Kartel', 20, 'Aji Teacha');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (2, 'Ray', 'Ramono', 50, 'Aji Teacha');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (3, 'Spice', 'Grace', 30, 'World Boss');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (4, 'Anthony', 'Ham', 70, 'Romeish Ent');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (5, 'Busy', 'Signal', 60, 'Aji Teacha');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (6, 'Alkiline', 'Artist', 20, 'World Boss');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (7, 'Bob', 'Marely', 50, 'Aji Teacha');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (8, 'Erika', 'Badu', 30, 'World Boss');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (9, 'India', 'Arie', 60, 'World Boss');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (10, 'Sally', 'Walker', 40, 'Aji Teacha');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (11, 'Bounty', 'Killer', 30, 'World Boss');
INSERT INTO employee_list (id, first_name, last_name, role_id, manager_id) VALUES (12, 'Voice', 'Mail', 50, 'Aji Teacha');

INSERT INTO role (id, title, salary, department_id) VALUES (70, 'Project Manager', 170000, 200);
INSERT INTO role (id, title, salary, department_id) VALUES (20, 'Intern', 35000, 100);
INSERT INTO department (department_id, dept_name) VALUES (200, 'Management');
INSERT INTO role (id, title, salary, department_id) VALUES (40, 'Team Leader', 70000, 200);
INSERT INTO role (id, title, salary, department_id) VALUES (30, 'Designer', 55000, 100);
INSERT INTO role (id, title, salary, department_id) VALUES (50, 'Engineer', 110000, 100);
INSERT INTO role (id, title, salary, department_id) VALUES (60, 'Developer', 90000, 100);
INSERT INTO department (department_id, dept_name) VALUES (100, 'Development');


SELECT * FROM employee_list;