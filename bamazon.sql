DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  department_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT(10) NOT NULL,
  PRIMARY KEY (item_id)
);


INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sassy Desk Plates", "Home Decor", 13.99, 6);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("55 Gallon Drum of Lube", "Arts & Crafts", 2043.96, 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("The NoPhone Air", "Electronics", 6.00, 12);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Cat Battle Armor", "Clothing & Accessories", 18.99, 3);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Nicolas Cage Face Mug", "Home & Kitchen", 15.99, 7);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Moving Beer Pong Bot", "Toys & Games", 39.99, 2);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Abusive Balloons", "Toys & Games", 9.00, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Donald Trump Chia Pet", "Lawn & Garden", 14.99, 45);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Pac-Man Suit", "Clothing & Accessories", 119.99, 9);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Macbook Selfie Stick", "Electronics", 21.99, 10);

SELECT * FROM bamazon.products;