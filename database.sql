CREATE TABLE inventory (
inventory_id serial PRIMARY KEY,
date_updated DATE,
status varchar(255)
);


CREATE TABLE taverns (
tavern_id serial PRIMARY KEY,
name_of_tavern varchar(255),
service_provided varchar(255),
latitude INT,
longitude INT
);


CREATE TABLE sales (
sales_id serial PRIMARY KEY,
guest_first_name varchar(255),
guest_last_name varchar(255),
price INT,
date_purchased DATE,
amount_purchased INT,
tavern_id INT,
FOREIGN KEY(tavern_id)
REFERENCES taverns(tavern_id)
);


CREATE TABLE supplies (
supply_id serial PRIMARY KEY,
name_of_item varchar(255),
unit varchar(255),
current_count INT,
inventory_id INT,
FOREIGN KEY(inventory_id)
REFERENCES inventory(inventory_id)
);



CREATE TABLE incomingSupplies (
    incomingSupplies_id INT,
    total_cost INT,
    amount_received INT,
    date_received DATE,
    supply_id INT,
    tavern_id INT,
     FOREIGN KEY(supply_id)
        REFERENCES supplies(supply_id),
    FOREIGN KEY(tavern_id)
        REFERENCES taverns(tavern_id)
);




INSERT INTO inventory (date_updated, status)
VALUES ('1989-01-01', 'active'),
    ('1990-01-01', 'inactive'),
    ('1995-01-01', 'active'),
    ('1996-01-01', 'inactive'),
    ('1997-01-01', 'active'),
    ('1998-01-01', 'inactive'),
    ('2010-01-01', 'active'),
    ('2015-01-01', 'inactive'),
    ('2016-01-01', 'active'),
    ('2020-01-01', 'active');


INSERT INTO taverns (name_of_tavern, service_provided, latitude, longitude)
VALUES ('johns_tavern', 'pool',  32.318230, -86.902298),
('johns second tavern', 'pool',  32.318230, -86.902298),
('bobs tavern', 'fooze ball',  52.318230, -86.902298),
('saras tavern', 'fun stuff',  72.318230, -86.902298),
('bills tavern', 'booze ball',  82.318230, -86.902298),
('marys tavern', 'extreme pool',  92.318230, -86.902298),
('the tavern', 'beer pong',  12.318230, -86.902298),
('jons tavern', 'extreme beer pong',  56.318230, -86.902298),
('robs tavern', 'b ball night',  78.318230, -86.902298),
('kats tavern', 'extreme b ball nigh',  11.318230, -86.902298),
('pauls tavern', 'pool',  23.318230, -86.902298);




INSERT INTO sales (guest_first_name, guest_last_name, price, date_purchased, amount_purchased, tavern_id)
VALUES ('bob', 'smith', 45, '2020-01-01', 4,  1  ),
('bob', 'smith', 45, '2020-01-01', 4,  2  ),
('rob', 'smith', 65, '2020-01-01', 5,  3  ),
('pablo', 'smith', 15, '2020-01-01', 1,  4  ),
('barl', 'smith', 85, '2020-01-01', 8,  5  ),
('mark', 'smith', 85, '2020-01-01', 8,  6  ),
('mike', 'smith', 15, '2020-01-01', 1,  7  ),
('sherry', 'smith', 25, '2020-01-01', 2,  8  ),
('katalina', 'smith', 50, '2020-01-01', 3,  9  );



INSERT INTO supplies (name_of_item, unit, current_count, inventory_id)
VALUES ('atm machine 1', 'kg', 1, 1 ),
('atm machine pnc', 'kg', 1, 2 ),
('atm machine 2', 'kg', 1, 3 ),
('atm machine 3', 'kg', 1, 4 ),
('atm machine 4', 'kg', 1, 5 ),
('atm machine 5', 'kg', 1, 6 ),
('atm machine 6', 'kg', 1, 7 ),
('atm machine 7', 'kg', 1, 8 ),
('atm machine 8', 'kg', 1, 9 );




INSERT INTO incomingsupplies (total_cost, amount_received, date_received, supply_id, tavern_id)
VALUES (2000, 1, '2020-01-01', 1, 1),
(2000, 1, '2020-01-01', 1, 1),
(2000, 1, '2010-01-01', 1, 1),
(2000, 1, '2000-01-01', 1, 1),
(2000, 1, '1990-01-01', 1, 1),
(2000, 1, '1995-01-01', 1, 1),
(2000, 1, '2021-01-01', 1, 1),
(2000, 1, '2022-01-01', 1, 1),
(2000, 1, '2023-01-01', 1, 1);
