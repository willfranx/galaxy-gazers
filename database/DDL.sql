SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

-- DROP TABLES --

DROP TABLE IF EXISTS Astronomers;
DROP TABLE IF EXISTS Celestial_Objects;
DROP TABLE IF EXISTS Prints;
DROP TABLE IF EXISTS Print_Sales;
DROP TABLE IF EXISTS Astronomer_Sales;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Customers;

-- CREATE TABLES --

CREATE TABLE Astronomers (
    astronomer_id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    social_media_handle varchar(255),
    PRIMARY KEY (astronomer_id)
);

CREATE TABLE Celestial_Objects (
    object_id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    astronomer_id int(11) NOT NULL,
    object_type varchar(255) DEFAULT NULL,
    object_name varchar(255) DEFAULT NULL,
    PRIMARY KEY (object_id),
    FOREIGN KEY (astronomer_id) REFERENCES Astronomers (astronomer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Prints (
    print_id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    num_stock int(11) DEFAULT NULL,
    astronomer_id int(11) NOT NULL,
    object_id int(11) NOT NULL,
    price decimal(9,2) DEFAULT NULL,
    PRIMARY KEY (print_id),
    FOREIGN KEY (astronomer_id) REFERENCES Astronomers (astronomer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (object_id) REFERENCES Celestial_Objects (object_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Print_Sales (
    id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    print_id int(11) NOT NULL,
    sale_id int(11) NOT NULL,
    quantity int(11) DEFAULT NULL,
    print_price decimal(9,2) DEFAULT NULL,
    line_total decimal(9,2) DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (print_id) REFERENCES Prints (print_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (sale_id) REFERENCES Sales (sale_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Astronomer_Sales (
  id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
  astronomer_id int(11) DEFAULT NULL,
  sale_id int(11) DEFAULT NULL,
  profit_due decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (astronomer_id) REFERENCES Astronomers (astronomer_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sale_id) REFERENCES Sales (sale_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Sales (
    sale_id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    customer_id int(11) NOT NULL,
    value decimal(9,2) NOT NULL,
    date date NOT NULL,
    PRIMARY KEY (sale_id),
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Customers (
    customer_id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    email varchar(255) UNIQUE DEFAULT NULL,
    first_name varchar(255),
    last_name varchar(255) DEFAULT NULL,
    address1 varchar(255),
    address2 varchar(255),
    city varchar(255),
    state varchar(255),
    zip_code varchar(10),
    phone varchar(255),
    PRIMARY KEY (customer_id)
);

-- INSERT TABLE DATA --

INSERT INTO Astronomers (first_name, last_name, email, social_media_handle)
VALUES ("Chet","Ubetchya","ChetU@gmail.com","@chetbet"),
("Timmy","Turner","Timmy.Turner@hotmail.com","@timmyTbb"),
("Cosmo",NULL,"whatsausername@aol.com","@fairiesrock"),
("Wanda",NULL,"wandawishmaker@gmail.com","@wandawishmaker"),
("Timmy's Dad",NULL,"numberonedad@gmail.com","@ihatedinkleburg");

INSERT INTO Celestial_Objects (astronomer_id, object_type, object_name)
VALUES (2,"Nebula","The Crab Nebula"),
(2,"Nebula","The Bubble Nebula"),
(4,"Comet","Halley's Comet"),
(5,"Planet","Mars"),
(1,"Planet","Mars"),
(1,"Planet","Saturn"),
(1,"planet","Mercury");

INSERT INTO Customers (email, first_name, last_name, address1, address2, city, state, zip_code, phone)
VALUES ("j_henderson@gmail.com","Jillian","Henderson","1234 Thumbwar Ave.",NULL,"Seattle","Washington","98101","206-874-9801"),
("mr-harris@outlook.com","Harris","Levy","24816 Squared St.",NULL,"Portland","Oregon","97203","314-867-5309"),
("yu.hussain@yahoo.com","Hussain","Yu","321 Countdown Blvd.",NULL,"Redmond","Washington","98008","765-852-7412"),
("harrygo@gmail.com","Harold","Goldshire","8990 Windy Rd.","Apt. 318","Seattle","Washington","98111","206-985-6622");

INSERT INTO Prints (num_stock, astronomer_id, object_id, price)
VALUES (2,2,1,25.00),
(5,2,2,30.00),
(0,4,3,30.00),
(3,5,4,80.00),
(30,1,5,60.00),
(5,1,7,55.00);

INSERT INTO Sales (customer_id, value, date)
VALUES (9,105.00,"2022-10-07"),
(10,140.00,"2022-09-13"),
(12,55.00,"2022-08-22"),
(9,120.00,"2021-10-05");

INSERT INTO Astronomer_Sales (id,astronomer_id,sale_id,profit_due)
VALUES (1,1,1,40.00),(2,1,1,44.00),(3,5,2,64.00),(4,1,2,48.00),(5,2,3,20.00),(6,4,3,24.00),(7,4,4,96.00);

INSERT INTO Print_Sales (print_id, sale_id, quantity, print_price, line_total)
VALUES (1,1,2,25.00,50.00),
(6,1,1,55.00,55.00),
(4,2,1,80.00,80.00),
(5,2,1,60.00,60.00),
(1,3,1,25.00,25.00),
(3,3,1,30.00,30.00),
(3,4,4,30.00,120.00);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;