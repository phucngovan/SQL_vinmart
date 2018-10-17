CREATE TABLE vinmart.customers
(
    customerNumber int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    customerName varchar(50) NOT NULL,
    contactLastName varchar(50) NOT NULL,
    contactFirstName varchar(50) NOT NULL,
    phone varchar(20) NOT NULL,
    addressLine1 varchar(50) NOT NULL,
    addressLine2 varchar(50),
    city varchar(50) NOT NULL,
    state varchar(50) NOT NULL,
    postalCode varchar(15) NOT NULL,
    country varchar(50) NOT NULL,
    creditLimit double
);
CREATE TABLE vinmart.employees
(
    employeeNumber int(11) PRIMARY KEY NOT NULL,
    lastName varchar(50) NOT NULL,
    firstName varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    jobTitle varchar(50) NOT NULL,
    customerNumber int(10),
    CONSTRAINT employees_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES vinmart.customers (customerNumber)
);
CREATE INDEX customerNumber ON vinmart.employees (customerNumber);
CREATE TABLE vinmart.offices
(
    officeCode varchar(10) PRIMARY KEY NOT NULL,
    city varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressLine1 varchar(50) NOT NULL,
    addressLine2 varchar(50),
    state varchar(50),
    country varchar(50) NOT NULL,
    postalCode varchar(15) NOT NULL,
    employeeNumber int(20),
    CONSTRAINT offices_ibfk_1 FOREIGN KEY (employeeNumber) REFERENCES vinmart.employees (employeeNumber)
);
CREATE INDEX employeeNumber ON vinmart.offices (employeeNumber);
CREATE TABLE vinmart.orderproduct
(
    orderNumber int(11) NOT NULL,
    productCode varchar(15) NOT NULL,
    CONSTRAINT `PRIMARY` PRIMARY KEY (orderNumber, productCode),
    CONSTRAINT orderproduct_ibfk_1 FOREIGN KEY (orderNumber) REFERENCES vinmart.orders (orderNumber),
    CONSTRAINT orderproduct_ibfk_2 FOREIGN KEY (productCode) REFERENCES vinmart.products (productCode)
);
CREATE INDEX productCode ON vinmart.orderproduct (productCode);
CREATE TABLE vinmart.orders
(
    orderNumber int(20) PRIMARY KEY NOT NULL,
    orderDate date NOT NULL,
    requiredDate date NOT NULL,
    shippedDate date NOT NULL,
    status varchar(15) NOT NULL,
    comments text,
    quantityOrdered int(150) NOT NULL,
    priceEach float NOT NULL,
    customerNumber int(10),
    CONSTRAINT orders_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES vinmart.customers (customerNumber)
);
CREATE INDEX customerNumber ON vinmart.orders (customerNumber);
CREATE TABLE vinmart.payments
(
    payments_number int(11) PRIMARY KEY NOT NULL,
    customerNumber int(20),
    checkNumber varchar(50) NOT NULL,
    paymentDate date NOT NULL,
    amount float NOT NULL,
    CONSTRAINT payments_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES vinmart.customers (customerNumber)
);
CREATE INDEX customerNumber ON vinmart.payments (customerNumber);
CREATE TABLE vinmart.productlines
(
    productLine varchar(50) PRIMARY KEY NOT NULL,
    textDescription varchar(50),
    image varchar(50),
    productCode varchar(15),
    CONSTRAINT productlines_ibfk_1 FOREIGN KEY (productCode) REFERENCES vinmart.products (productCode)
);
CREATE INDEX productCode ON vinmart.productlines (productCode);
CREATE TABLE vinmart.products
(
    productCode varchar(15) PRIMARY KEY NOT NULL,
    productName varchar(70) NOT NULL,
    productScale varchar(10) NOT NULL,
    productVendor varchar(50) NOT NULL,
    productDescription text NOT NULL,
    quantityInStock int(20) NOT NULL,
    buyPrice float NOT NULL,
    MSRP float NOT NULL
);