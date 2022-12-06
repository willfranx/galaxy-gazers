/* ASTRONOMERS */

-- Add astronomer to the club:

INSERT INTO Astronomers (first_name, last_name, email, social_media_handle)
VALUES (:first_name_input, :last_name_input, :email_input, :social_media_handle_input);

-- View all Astronomers

SELECT * FROM Astronomers;

--Update astronomer's information:
UPDATE Astronomers SET first_name = :first_name_input, last_name = :last_name_input, email = :email_input, social_media_handle = :social_media_handle_input WHERE astronomer_id= :astronomer_id_from_the_update_form;


--Remove astronomer from the club:

DELETE FROM Astronomers WHERE id = :astronomer_id_selected_from_astronomer_list;


/* CELESTIAL OBJECTS */

-- Document new celestial object:

INSERT INTO Celestial_Objects (astronomer_id, type, name)
VALUES (:astronomer_id_selected_from_dropdown, :type_selected_from_dropdown, :name_input);

-- View all celestial objects

SELECT * FROM Celestial_Objects;

-- Update celestial object:

UPDATE Celestial_Objects SET name = :astronomer_id_selected_from_dropdown, type = :type_selected_from_dropdown, name = :name_input WHERE celestial_object_id= :object_id_from_the_update_form;

-- Delete celestial object:

DELETE FROM Celestial_Objects WHERE id = :object_id_selected_from_dropdown;

/* CUSTOMERS */

-- Create a new customer:

INSERT INTO Customers (email, first_name, last_name, address1, address2, city, state, zip_code, phone)
VALUES (:email_input, :first_name_input, :last_name_input :address1_input, :address2_input, city_input, :state_selected_from_dropdown, :zip_code_input, :phone_input);
List all customers:

-- View customers

SELECT * FROM Customers;

-- Update customer:

UPDATE Customers SET email = :email_input, first_name = :first_nameInput, last_name = :last_name_input, address1 = :address1_input, address2 = :address2_input, city = :city_input, zip_code = :zip_code_input, state = :state_selected_from_dropdown, phone = :phone_input  WHERE customer_id= :customer_id_from_the_update_form;


-- Delete customer:

DELETE FROM Customers WHERE id = :customer_id_selected_from_customer_list;

/* PRINTS */

-- Add prints to stock
INSERT INTO Prints (num_stock, astronomer_id, object_id, price)
VALUES (:num_stock_input, :astronomer_id_selected_from_dropdown, :object_id_selected_from_dropdown, :price_input);

-- Updates a print in the database
UPDATE Prints SET num_stock = :num_stock_input, price = price_input

/* SALES */

-- Create a new sale

INSERT INTO Sales (customer_id, value, date)
VALUES (:customer_id_input, :value_input, :date_input);

-- View list of sales

SELECT value, date FROM Sales;

/* PRINT SALES to be displayed below Sales table on UI */

-- view the intermediary table Print_Sales

SELECT * FROM Print_Sales;

INSERT INTO Print_Sales (print_id, sale_id, quantity, print_price, line_total) VALUES (:print-id-input, :sale-id-input, :quantity-input, :print-price-input, line-total-input)

/* ASTRONOMER SALES to be displayed below Sales table on UI */

-- view the intermediary table Astronomer_Sales

SELECT * FROM Astronomer_Sales

INSERT INTO Astronomer_Sales (astronomer_id, sale_id, profit_due)
VALUES (:astronomer-id-input, :sale-input, :profit-due-input);