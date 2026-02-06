INNER JOIN
mysql> -- Student ID: 28966
mysql> -- INNER JOIN: Only shipments that have valid clients and valid routes
mysql> SELECT
    ->     s.shipment_id,
    ->     c.client_name,
    ->     c.industry,
    ->     r.origin,
    ->     r.destination,
    ->     s.shipment_date,
    ->     s.status,
    ->     s.cost
    -> FROM shipments s
    -> INNER JOIN clients c ON s.client_id = c.client_id
    -> INNER JOIN routes r ON s.route_id = r.route_id;

LEFT JOIN

mysql> -- Student ID: 28966
mysql> -- LEFT JOIN: Identify clients who have never made a shipment
mysql> SELECT
    ->     c.client_id,
    ->     c.client_name,
    ->     c.region
    -> FROM clients c
    -> LEFT JOIN shipments s ON c.client_id = s.client_id
    -> WHERE s.shipment_id IS NULL;

RIGHT JOIN
mysql> -- Student ID: 28966
mysql> -- RIGHT JOIN: Detect routes with no shipment activity
mysql> SELECT
    ->     r.route_id,
    ->     r.origin,
    ->     r.destination,
    ->     r.distance_km
    -> FROM shipments s
    -> RIGHT JOIN routes r ON s.route_id = r.route_id
    -> WHERE s.shipment_id IS NULL;

FULL OUTER JOIN
mysql> -- Student ID: 28966
mysql> -- FULL OUTER JOIN in MySQL: Combine clients and routes including unmatched shipments
mysql> SELECT
    ->     c.client_name,
    ->     r.destination,
    ->     s.shipment_date,
    ->     s.status
    -> FROM clients c
    -> LEFT JOIN shipments s ON c.client_id = s.client_id
    -> LEFT JOIN routes r ON s.route_id = r.route_id
    ->
    -> UNION
    ->
    -> SELECT
    ->     c.client_name,
    ->     r.destination,
    ->     s.shipment_date,
    ->     s.status
    -> FROM routes r
    -> LEFT JOIN shipments s ON r.route_id = s.route_id
    -> LEFT JOIN clients c ON s.client_id = c.client_id;

SELF JOIN
mysql> -- Student ID: 28966
mysql> -- SELF JOIN: Find pairs of clients located in the same region
mysql> SELECT
    ->     a.client_name AS client_1,
    ->     b.client_name AS client_2,
    ->     a.region
    -> FROM clients a
    -> JOIN clients b
    -> ON a.region = b.region
    -> AND a.client_id <> b.client_id;