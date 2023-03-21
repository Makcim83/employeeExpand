-- Создайте таблицу city с колонками city_id и city_name.
-- Добавьте в таблицу employee колонку city_id.
-- Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city.


CREATE TABLE city
(
    city_id     BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name   VARCHAR(50) NOT NULL,
    UNIQUE (city_name)
);


-- Добавьте в таблицу employee колонку city_id.
-- Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city.
DROP TABLE employee;

CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL,
    city_id    BIGSERIAL   REFERENCES city (id),
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

-- Заполните таблицу city и назначьте работникам соответствующие города.
INSERT INTO city (city_name)
VALUES ('Moscov');

INSERT INTO city (city_name)
VALUES ('Piter');

INSERT INTO city (city_name)
VALUES ('Ekaterinburg');

INSERT INTO city (city_name)
VALUES ('Kazan');

INSERT INTO city (city_name)
VALUES ('Ufa');

-- Заполните таблицу city и назначьте работникам соответствующие города.
UPDATE employee
SET city_id = 1
WHERE id = 1;

UPDATE employee
SET city_id = 5
WHERE id = 2;

UPDATE employee
SET city_id = 2
WHERE id = 3;

UPDATE employee
SET city_id = 1
WHERE id = 4;

UPDATE employee
SET city_id = 4
WHERE id = 5;


-- Получите имена и фамилии сотрудников, а также города, в которых они проживают.
-- Получите города, а также имена и фамилии сотрудников, которые в них проживают. Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.
-- Получите имена всех сотрудников и названия всех городов. Если в городе не живет никто из сотрудников, то вместо имени должен стоять null. Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.
-- Получите таблицу, в которой каждому имени должен соответствовать каждый город.
-- Получите имена городов, в которых никто не живет.