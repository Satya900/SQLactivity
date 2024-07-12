CREATE DATABASE Salesdb;

USE Salesdb;

CREATE TABLE productlines (
    productLine VARCHAR(50) PRIMARY KEY,
    textDescription VARCHAR(4000),
    htmlDescription MEDIUMTEXT,
    image MEDIUMBLOB
);

CREATE TABLE products (
    productCode VARCHAR(15) PRIMARY KEY,
    productName VARCHAR(70) not null,
    productLine VARCHAR(50),
    productScale VARCHAR(10) not null,
    productVendor VARCHAR(50) not null,
    productDescription TEXT not null,
    quantityInStock SMALLINT not null
    buyPrice DECIMAL(10, 2) not null,
    MSRP DECIMAL(10, 2) not null,
    foreign key (productLine) references productlines(productLine)
);


CREATE TABLE employees (
employeeNumber INT primary key unique,
lastName VARCHAR(50) not null,
firstName VARCHAR(50) not null,
extension VARCHAR(10) not null,
email VARCHAR(100) not null,
officeCode VARCHAR(10),
reportsTo INT,
jobTitle VARCHAR(50) not null,
foreign key (officeCode) references offices(officeCode),
foreign key (reportsTo) references employees(employeeNumber)
)



CREATE TABLE offices (
officeCode VARCHAR(10) primary key,
city VARCHAR(50) not null,
phone VARCHAR(50) not null,
addressLine1 VARCHAR(50) not null,
addressLine2 VARCHAR(50) not null,
state VARCHAR(50),
country VARCHAR(50) not null,
postalCode VARCHAR(15) not null,
territory VARCHAR(10) not null
)

CREATE TABLE customers (
customerNumber INT primary key,
customerName VARCHAR(50) not null,
contactLastName VARCHAR(50) not null,
contactFistName VARCHAR(50) not null,
phone VARCHAR(50) not null,
addressline1 VARCHAR(50) not null,
addressline2 VARCHAR(50) not null,
city VARCHAR(50) not null,
state VARCHAR(50) not null,
postalCode VARCHAR(15),
country VARCHAR(50) not null,
salesRepEmployeeNumber INT,
creditLimit DECIMAL(10,2),
foreign key (salesRepEmployeeNumber) references employees(employeeNumber)
);

CREATE TABLE orders (
    orderNumber INT PRIMARY KEY,
    orderDate DATE NOT NULL,
    requiredDate DATE NOT NULL,
    shippedDate DATE,
    status VARCHAR(15) NOT NULL,
    comments TEXT,
    customerNumber INT,
    foreign key (customerNumber) references customers(customerNumber)
);

CREATE TABLE orderdetails (
    orderNumber INT,
    productCode VARCHAR(15),
    quantityOrdered INT NOT NULL,
    priceEach DECIMAL(10, 2) NOT NULL,
    orderLineNumber SMALLINT NOT NULL,
    PRIMARY KEY (orderNumber, productCode),
    foreign key (orderNumber) references orders(orderNumber),
    foreign key (productCode) references products(productCode)
);

CREATE TABLE payments (
    customerNumber INT,
    checkNumber VARCHAR(50) PRIMARY KEY,
    paymentDate DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    foreign key (customerNumber) references customers(customerNumber)
);




