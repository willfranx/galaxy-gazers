SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- Table structure for table Astronomers

DROP TABLE IF EXISTS Astronomers;
CREATE TABLE Astronomers (
  astronomer_id int(11) NOT NULL AUTO_INCREMENT,
  fname varchar(255) NOT NULL,
  lname varchar(255) DEFAULT NULL,
  email varchar(255) NOT NULL,
  social_media_handle varchar(255) DEFAULT NULL,
  PRIMARY KEY (astronomer_id),
  UNIQUE KEY astronomer_id_UNIQUE (astronomer_id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Insert data for table Astronomers

LOCK TABLES Astronomers WRITE;
INSERT INTO Astronomers (fname, lname, email, social_media_handle)
VALUES ('Chet','Ubetchya','ChetU@gmail.com','@chetbet'),('Timmy','Turner','Timmy.Turner@hotmail.com','@timmyTbb'),('Cosmo',NULL,'whatsausername@aol.com','@fairiesrock'),('Wanda',NULL,'wandawishmaker@gmail.com','@wandawishmaker'),("Timmy's Dad",NULL,'numberonedad@gmail.com','@ihatedinkleburg');
UNLOCK TABLES;

-- Table structure for table Astronomer_Sales

DROP TABLE IF EXISTS Astronomer_Sales;
CREATE TABLE Astronomer_Sales (
  id int(11) NOT NULL AUTO_INCREMENT,
  astronomer_id int(11) DEFAULT NULL,
  sale_id int(11) DEFAULT NULL,
  profit_due decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY astronomer_id (astronomer_id),
  KEY sale_id (sale_id),
  CONSTRAINT Astronomer_Sales_ibfk_1 FOREIGN KEY (astronomer_id) REFERENCES Astronomers (astronomer_id),
  CONSTRAINT Astronomer_Sales_ibfk_2 FOREIGN KEY (sale_id) REFERENCES Sales (sale_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Insert data for table Astronomer_Sales

LOCK TABLES Astronomer_Sales WRITE;
INSERT INTO Astronomer_Sales (astronomer_id,sale_id,profit_due)
VALUES (1,1,40.00),(1,1,44.00),(5,2,64.00),(1,2,48.00),(2,3,20.00),(4,3,24.00),(4,4,96.00);
UNLOCK TABLES;

--
-- Table structure for table Celestial_Objects
--

DROP TABLE IF EXISTS Celestial_Objects;
CREATE TABLE Celestial_Objects (
  object_id int(11) NOT NULL AUTO_INCREMENT,
  astronomer_id int(11) NOT NULL,
  type varchar(255) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (object_id),
  UNIQUE KEY object_id_UNIQUE (object_id),
  KEY fk_Celestial_Objects_Astronomers_idx (astronomer_id),
  CONSTRAINT fk_Celestial_Objects_Astronomers FOREIGN KEY (astronomer_id) REFERENCES Astronomers (astronomer_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Insert data for table Celestial_Objects

LOCK TABLES Celestial_Objects WRITE;
INSERT INTO Celestial_Objects (astronomer_id, type, name)
VALUES (2,'Nebula','The Crab Nebula'),(2,'Nebula','The Bubble Nebula'),(4,'Comet',"Halley's Comet"),(5,'Planet','Mars'),(1,'Planet','Mars'),(1,'Planet','Saturn'),(1,'Planet','Mercury');
UNLOCK TABLES;

-- Table structure for table Customers

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
  customer_id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(255) DEFAULT NULL,
  fname varchar(255) NOT NULL,
  lname varchar(255) NOT NULL,
  address1 varchar(255) DEFAULT NULL,
  address2 varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  PRIMARY KEY (customer_id),
  UNIQUE KEY customer_id_UNIQUE (customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Insert data for table Customers

LOCK TABLES Customers WRITE;
INSERT INTO Customers (email, fname, lname, address1, address2, city, state, phone)
VALUES ('j_henderson@gmail.com','Jillian','Henderson','1234 Thumbwar Ave.',NULL,'Seattle','Washington','206-874-9801'),('mr-harris@outlook.com','Harris','Levy','24816 Squared St.',NULL,'Portland','Oregon','314-867-5309'),('yu.hussain@yahoo.com','Hussain','Yu','321 Countdown Blvd.',NULL,'Redmond','Washington','765-852-7412'),('harrygo@gmail.com','Harold','Goldshire','8990 Windy Rd.','Apt. 318','Seattle','Washington','206-985-6622');
UNLOCK TABLES;

-- Table structure for table Print_Sales

DROP TABLE IF EXISTS Print_Sales;
CREATE TABLE Print_Sales (
  id int(11) NOT NULL AUTO_INCREMENT,
  print_id int(11) NOT NULL,
  sale_id int(11) NOT NULL,
  quantity int(11) DEFAULT NULL,
  print_price decimal(9,2) DEFAULT NULL,
  line_total decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY print_id (print_id),
  KEY Print_Sales_ibfk_2 (sale_id),
  CONSTRAINT Print_Sales_ibfk_1 FOREIGN KEY (print_id) REFERENCES Prints (print_id),
  CONSTRAINT Print_Sales_ibfk_2 FOREIGN KEY (sale_id) REFERENCES Sales (sale_id)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table Print_Sales

LOCK TABLES Print_Sales WRITE;
INSERT INTO Print_Sales (print_id, sale_id, quantity, print_price, line_total)
VALUES (1,1,2,25.00,50.00),(6,1,1,55.00,55.00),(4,2,1,80.00,80.00),(5,2,1,60.00,60.00),(1,3,1,25.00,25.00),(3,3,1,30.00,30.00),(3,4,4,30.00,120.00);
UNLOCK TABLES;

-- Table structure for table Prints

DROP TABLE IF EXISTS Prints;
CREATE TABLE Prints (
  print_id int(11) NOT NULL AUTO_INCREMENT,
  num_stock int(11) DEFAULT NULL,
  astronomer_id int(11) NOT NULL,
  object_id int(11) NOT NULL,
  price decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (print_id),
  UNIQUE KEY print_id_UNIQUE (print_id),
  KEY fk_Prints_Astronomers1_idx (astronomer_id),
  KEY fk_Prints_Celestial_Objects1_idx (object_id),
  CONSTRAINT fk_Prints_Astronomers1 FOREIGN KEY (astronomer_id) REFERENCES Astronomers (astronomer_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Prints_Celestial_Objects1 FOREIGN KEY (object_id) REFERENCES Celestial_Objects (object_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table Prints

LOCK TABLES Prints WRITE;
INSERT INTO Prints (num_stock, astronomer_id, object_id, price)
VALUES (2,2,1,25.00),(5,2,2,30.00),(0,4,3,30.00),(3,5,4,80.00),(30,1,5,60.00),(5,1,7,55.00);
UNLOCK TABLES;

-- Table structure for table Sales

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales (
  sale_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  value decimal(9,2) NOT NULL,
  date date NOT NULL,
  PRIMARY KEY (sale_id),
  UNIQUE KEY sale_id_UNIQUE (sale_id),
  KEY fk_Sales_Customers1_idx (customer_id),
  CONSTRAINT fk_Sales_Customers1 FOREIGN KEY (customer_id) REFERENCES Customers (customer_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT=fda;

-- Dumping data for table Sales

LOCK TABLES Sales WRITE;
INSERT INTO Sales (customer_id, value, date)
VALUES (9,105.00,'2022-10-07'),(10,140.00,'2022-09-13'),(12,55.00,'2022-08-22'),(9,120.00,'2021-10-05');
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;
COMMIT;