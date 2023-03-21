-- Создайте таблицу city с колонками city_id и city_name.
CREATE TABLE city
(
    city_id     BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name   VARCHAR(50) NOT NULL
);

-- Добавьте в таблицу employee колонку city_id.
-- Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city.
CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL,
    city_id    BIGSERIAL   NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city (city_id)
);

-- Заполните таблицу city и назначьте работникам соответствующие города.
INSERT INTO city (city_name)
VALUES ('Moscow');

INSERT INTO city (city_name)
VALUES ('Piter');

INSERT INTO city (city_name)
VALUES ('Ekaterinburg');

INSERT INTO city (city_name)
VALUES ('Kazan');

INSERT INTO city (city_name)
VALUES ('Ufa');

INSERT INTO employee (first_name, last_name, gender, age, city_id)
VALUES ('Ivan', 'Ivanov', 'male', 29, 1);

INSERT INTO employee (first_name, last_name, gender, age, city_id)
VALUES ('Anna', 'Sidorova', 'female', 25, 5);

INSERT INTO employee (first_name, last_name, gender, age, city_id)
VALUES ('Victoria', 'Petrova', 'female', 52, 2);

INSERT INTO employee (first_name, last_name, gender, age, city_id)
VALUES ('Vladislav', 'Semenov', 'male', 55, 1);

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



-- Получите имена и фамилии сотрудников, а также города, в которых они проживают.
SELECT first_name, last_name, city_name
FROM employee
JOIN city ON city.city_id = employee.city_id;

-- Получите города, а также имена и фамилии сотрудников, которые в них проживают.
--      Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.
SELECT city_name, first_name, last_name
FROM city
LEFT JOIN employee ON employee.city_id = city.city_id
ORDER BY city_name;

-- Получите имена всех сотрудников и названия всех городов.
--      Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
--      Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.
SELECT city_name, first_name, last_name
FROM city
FULL OUTER JOIN employee ON employee.city_id = city.city_id
ORDER BY city_name;

-- Получите таблицу, в которой каждому имени должен соответствовать каждый город.
SELECT city_name, first_name, last_name
FROM city
CROSS JOIN employee
ORDER BY city_name;

-- Получите имена городов, в которых никто не живет.
SELECT city_name
FROM city
FULL OUTER JOIN employee ON city.city_id = employee.city_id
WHERE employee is NULL;