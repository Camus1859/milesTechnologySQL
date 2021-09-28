--Foreign key constraint error

-- ALTER TABLE tavernServices ADD COLUMN service_id INT references services;

CREATE TABLE supplies (
supply_id serial PRIMARY KEY,
item_name varchar(255)
);

CREATE TABLE taverns (
tavern_id serial PRIMARY KEY,
name_of_tavern varchar(255),
latitude INT,
longitude INT
);

CREATE TABLE status (
    status_id serial PRIMARY KEY,
    status varchar(255)
);


CREATE TABLE inventory (
inventory_id serial PRIMARY KEY,
unit varchar(255),
current_count INT,
date_updated DATE,
supply_id INT,
tavern_id INT,
status_id INT,
FOREIGN KEY(supply_id)
    REFERENCES supplies(supply_id),
FOREIGN KEY(tavern_id)
    REFERENCES taverns(tavern_id),
FOREIGN KEY(status_id)
    REFERENCES status(status_id)
);

--foreign key constraint error

-- CREATE TABLE inventory (
-- inventory_id serial PRIMARY KEY,
-- unit varchar(255),
-- current_count INT,
-- date_updated DATE,
-- FOREIGN KEY(supply_id)
--     REFERENCES supplies(supply_id),
-- FOREIGN KEY(tavern_id)
--     REFERENCES taverns(tavern_id),
-- FOREIGN KEY(status_id)
--     REFERENCES status(status_id)
-- );


CREATE TABLE services (
service_id serial PRIMARY KEY,
service varchar(255)
);

CREATE TABLE tavernServices (
date_added DATE
);

ALTER TABLE tavernServices ADD COLUMN service_id INT references services;

ALTER TABLE tavernServices ADD COLUMN taverns_id INT references taverns;


CREATE TABLE birthdays (
    birthday_id serial PRIMARY KEY,
    birthdate DATE
);


CREATE TABLE users (
    user_id serial PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
    notes_on_user varchar(1000)
);


ALTER TABLE users ADD COLUMN birthday_id INT references birthdays;


CREATE TABLE sales (
sale_id serial PRIMARY KEY,
amount_purchased INT,
date_purchased DATE
);

ALTER TABLE sales ADD COLUMN supply_id INT references supplies;

ALTER TABLE sales ADD COLUMN tavern_id INT references taverns;


CREATE TABLE supplies_received (
    supply_received_id serial PRIMARY KEY,
    price INT,
    number_of_items INT,
    date_received DATE
);

ALTER TABLE supplies_received ADD COLUMN supply_id INT references supplies;

ALTER TABLE supplies_received ADD COLUMN tavern_id INT references taverns;

CREATE TABLE classes (
    class_id serial PRIMARY KEY,
    class_name varchar(255)
);

CREATE TABLE levels (
    level_id serial PRIMARY KEY,
    level INT
);

CREATE TABLE classLevels (
    class_id INT,
    level_id INT,
    FOREIGN KEY(class_id)
    REFERENCES classes(class_id),
FOREIGN KEY(level_id)
    REFERENCES levels(level_id)
);




INSERT INTO inventory (unit, current_count, date_updated, supply_id, tavern_id, status_id)
VALUES('kg', 4, '2020-01-01', 1, 1, 1),
('kg', 3, '2021-01-01', 2, 2, 2),
('kg', 4, '2020-02-01', 3, 3, 3),
('kg', 6, '2020-03-01', 4, 4, 4),
('kg', 7, '2020-04-01', 5, 5, 5);


INSERT INTO services (service)
VALUES ('pool'),
 ('extreme pool'),
 ('extreme pool to the max'),
 ('pool ball'),
 ('extreme pool ball');



INSERT INTO taverns (name_of_tavern, latitude, longitude)
VALUES ('johns_tavern', 32.318230, -86.902298),
('johns second tavern',  32.318230, -86.902298),
('bobs tavern',  52.318230, -86.902298),
('saras tavern', 72.318230, -86.902298),
('bills tavern',   82.318230, -86.902298);


INSERT INTO status (status)
VALUES ('sick'),
 ('fine'),
 ('hangry'),
 ('raging'),
 ('placid');


INSERT INTO tavernServices (date_added, service_id, tavern_id)
VALUES ('2010-10-01', 1, 1),
 ('2011-10-01', 2, 2),
 ('2015-10-01', 3, 3),
 ('2019-10-01', 4, 4),
 ('2020-10-01', 5, 5);


INSERT INTO birthdays (birthdate)
VALUES ('1940-10-01'),
 ('1950-05-06'),
 ('1960-10-08'),
 ('1970-10-03'),
 ('1980-10-02');


INSERT INTO users (first_name, last_name, notes_on_user, birthday_id, status_id)
VALUES ('bob', 'smith', 'aaaaaaaaaaaaaaaaa', 1, 1 ),
('bob', 'smith', 'bbbbbbbbbbbb', 2, 2  ),
('rob', 'smith', 'ccccccccccc', 3, 3),
('pablo', 'smith', 'ddddddddddddddd', 4, 4  ),
('pablo', 'smith jr', 'eeeeeeeeeeeeeee', 5, 5  );



INSERT INTO supplies (item_name)
VALUES ('atm machine 1'),
('atm machine pnc'),
('atm machine 2'),
('atm machine 3'),
('atm machine 4');


INSERT INTO sales (amount_purchased, date_purchased, price, supply_id, tavern_id)
VALUES (10000, '2004-01-01', 1000, 1, 1),
(1000, '2004-01-01', 5000, 2, 2),
(1000, '2004-01-01', 3000, 3, 3),
(1000, '2004-01-01', 2000, 4, 4),
(1000, '2004-01-01', 500, 5, 5);


INSERT INTO supplies_received (price, number_of_items, date_received, supply_id, tavern_id)
VALUES (50, 3, '2005-01-01', 1, 1),
(60, 2, '2008-01-01', 2, 2),
(70, 3, '2009-01-01', 3, 3),
(80, 1, '2015-01-01', 4, 4),
(90, 3, '2007-01-01', 5, 5);

INSERT INTO classes (class_name)
VALUES('mage'),
('fighter'),
('fighter'),
('fighter'),
('fighter');

INSERT INTO levels (level)
VALUES (2),
(3),
(500),
(10),
(0);


INSERT INTO classLevels(class_id, level_id)
VALUES(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);