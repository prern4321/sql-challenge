CREATE TABLE "Employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" VARCHAR NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" CHAR(1) NOT NULL,
    "hire_date" VARCHAR NOT NULL,
     PRIMARY KEY ("emp_no")
);
SELECT * FROM "Employees";

CREATE TABLE "Departments" (
    "dept_no" VARCHAR PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR  NOT NULL
);
SELECT * FROM "Departments";

CREATE TABLE "Department_Employees" (
    "emp_no" INT NOT NULL,
        FOREIGN KEY (emp_no) REFERENCES "Employees"(emp_no),
    "dept_no" VARCHAR NOT NULL,
        FOREIGN KEY (dept_no) REFERENCES "Departments"(dept_no),
    PRIMARY KEY (emp_no,dept_no)
);
SELECT * FROM "Department_Employees"

CREATE TABLE "Department_Manager" (
    "dept_no" VARCHAR NOT NULL,
        FOREIGN KEY (dept_no) REFERENCES "Departments"(dept_no),
    "emp_no" INT NOT NULL,
        FOREIGN KEY (emp_no) REFERENCES "Employees"(emp_no),
    PRIMARY KEY (emp_no,dept_no)
);
SELECT * FROM "Department_Manager"

CREATE TABLE "Salaries" (
    "emp_no" INT NOT NULL,
        FOREIGN KEY (emp_no) REFERENCES "Employees"(emp_no),
    "salary" INT NOT NULL
);SELECT * FROM "Salaries"

CREATE TABLE "Titles"(
    "emp_title_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL, 
	CONSTRAINT pk_titles PRIMARY KEY (emp_title_id)
-- 	FOREIGN KEY (title_id) REFERENCES "Employees"(emp_title_id)
);
SELECT * FROM "Titles";