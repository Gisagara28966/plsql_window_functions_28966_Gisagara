mysql> -- Insert clients 28966
mysql> INSERT INTO clients (client_name, industry, region) VALUES
    -> ('Umuganda Ltd', 'Manufacturing', 'Kigali'),
    -> ('Inyange Industries', 'Food & Beverage', 'Western'),
    -> ('AC Group', 'IT Services', 'Northern'),
    -> ('Rwanda HealthCare', 'Healthcare', 'Eastern'),
    -> ('EcoBuild Rwanda', 'Construction', 'Southern');
Query OK, 5 rows affected (0.42 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert routes 28966
mysql> INSERT INTO routes (origin, destination, distance_km) VALUES
    -> ('Kigali', 'Musanze', 90),
    -> ('Kigali', 'Huye', 130),
    -> ('Musanze', 'Gisenyi', 200),
    -> ('Huye', 'Nyamasheke', 150),
    -> ('Gisenyi', 'Rubavu', 100);
Query OK, 5 rows affected (0.07 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert shipments 28966
mysql> INSERT INTO shipments (client_id, route_id, shipment_date, status, cost) VALUES
    -> (1, 1, '2026-01-05', 'Delivered', 150.00),
    -> (1, 2, '2026-01-15', 'Delivered', 250.00),
    -> (2, 3, '2026-01-10', 'In Transit', 300.00),
    -> (2, 2, '2026-02-02', 'Delivered', 220.00),
    -> (3, 1, '2026-01-20', 'Delayed', 180.00),
    -> (3, 4, '2026-02-01', 'Delivered', 400.00),
    -> (4, 5, '2026-02-03', 'Delivered', 500.00),
    -> (5, NULL, '2026-02-05', 'In Transit', 0.00);
Query OK, 8 rows affected (0.08 sec)
Records: 8  Duplicates: 0  Warnings: 0