USE lab_mysql;
CREATE TABLE SALES (
    sale_id INT NOT NULL AUTO_INCREMENT,
    VIN INT,
    customer_id INT,
    staff_id INT,
    PRIMARY KEY (sale_id),

    -- Multiple foreign keys
    CONSTRAINT fk_sales_car FOREIGN KEY (VIN) REFERENCES CARS(VIN),
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    CONSTRAINT fk_sales_staff FOREIGN KEY (staff_id) REFERENCES SALESPERSONS(staff_id)
);

-- ==============================================================================================
USE lab_mysql;

CREATE TABLE SALES (
    sale_id INT NOT NULL AUTO_INCREMENT,
    VIN INT,
    customer_id INT,
    staff_id INT,
    PRIMARY KEY (sale_id)
);
-- ==============================================================================================
ALTER TABLE SALES
ADD CONSTRAINT fk_sales_car FOREIGN KEY (VIN) REFERENCES CARS(VIN),
ADD CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
ADD CONSTRAINT fk_sales_staff FOREIGN KEY (staff_id) REFERENCES SALESPERSONS(staff_id);
-- ==============================================================================================

ALTER TABLE SALES
DROP FOREIGN KEY fk_sales_customer;
