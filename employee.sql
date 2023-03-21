CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);
);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'male', 29);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Anna', 'Sidorova', 'female', 25);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Victoria', 'Petrova', 'female', 52);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Vladislav', 'Semenov', 'male', 55);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Igor', 'Popov', 'male', 42);

-- Измените имена у двух сотрудников так, чтобы на 5 сотрудников было
-- только 3 разных имени, то есть чтобы получились две пары тезок и
-- один сотрудник с уникальным именем.
UPDATE employee
SET first_name='Anna'
WHERE id = 3;

UPDATE employee
SET first_name='Vladislav'
WHERE id = 5;