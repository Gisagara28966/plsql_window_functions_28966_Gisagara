mysql> -- 1. Create clients table(28966)
mysql> CREATE TABLE clients (
    ->     client_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     client_name VARCHAR(100) NOT NULL,
    ->     industry VARCHAR(50) NOT NULL,
    ->     region VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (1.30 sec)

mysql> -- 2. Create routes table(28966)
mysql> CREATE TABLE routes (
    ->     route_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     origin VARCHAR(50) NOT NULL,
    ->     destination VARCHAR(50) NOT NULL,
    ->     distance_km INT NOT NULL
    -> );
Query OK, 0 rows affected (0.56 sec)

mysql> -- 3. Create shipments table(28966)
mysql> CREATE TABLE shipments (
    ->     shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     client_id INT,
    ->     route_id INT,
    ->     shipment_date DATE NOT NULL,
    ->     status VARCHAR(20) NOT NULL, -- Delivered, In Transit, Delayed
    ->     cost DECIMAL(10,2) NOT NULL,
    ->     FOREIGN KEY (client_id) REFERENCES clients(client_id),
    ->     FOREIGN KEY (route_id) REFERENCES routes(route_id)
    -> );
Query OK, 0 rows affected (1.10 sec)