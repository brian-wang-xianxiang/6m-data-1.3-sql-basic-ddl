create Table students (
  id int primary key,
  name varchar,
  address varchar,
  phone varchar,
  email varchar,
  class_id int
);


create Table students1 (
  id int primary key,
  name varchar,
  address varchar,
  phone varchar,
  email varchar,
  class_id int references classes(id)
);

create Table  if not exists teachers (
  id int primary key, 
  name varchar,
  age int,
  address varchar,
  phone varchar,
  email varchar
);


create Table classes (
  id int primary key,
  name varchar,
  teacher_id int
);


# alter table lesson.students add foreign KEY on class_id references classes(id);

Ref: students.class_id > classes.id // many-to-one

Ref: classes.teacher_id > teachers.id // many-to-one


-- Create a unique index 'teachers_name_idx' on the column name of table teachers.

CREATE UNIQUE INDEX teachers_name_idx ON lesson.teachers(name);

-- Create index 'students_name_idx' that allows for duplicate values on the column name of table students.

CREATE INDEX students_name_idx ON lesson.students(name);

-- View indexes for a specific table
SELECT index_name, sql 
FROM duckdb_indexes 
WHERE table_name = 'teachers';


CREATE VIEW lesson.students_view AS
SELECT id, name, email
FROM lesson.students;


COPY lesson.teachers FROM '/Users/Brian/learn/ntu/course-ware/6m-data-1.3-sql-basic-ddl/data/teachers.csv' (AUTO_DETECT TRUE);
COPY lesson.students FROM '/Users/Brian/learn/ntu/course-ware/6m-data-1.3-sql-basic-ddl/data/students.csv' (AUTO_DETECT TRUE);
COPY lesson.classes FROM '/Users/Brian/learn/ntu/course-ware/6m-data-1.3-sql-basic-ddl/data/classes.csv' (AUTO_DETECT TRUE);

COPY (select * from lesson.classes) to '/Users/Brian/learn/ntu/course-ware/6m-data-1.3-sql-basic-ddl/data/classes1.csv';
COPY (select * from lesson.classes) to '/Users/Brian/learn/ntu/course-ware/6m-data-1.3-sql-basic-ddl/data/classes1.json';


select * from  duckdb_indexes()


select * from lesson.students_view

