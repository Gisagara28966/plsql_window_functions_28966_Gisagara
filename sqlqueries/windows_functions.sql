RANKING FUNCTIONS
mysql> -- Student ID: 28966
mysql> -- Ranking clients by total shipment cost
mysql>
mysql> SELECT
    ->     client_name,
    ->     total_cost,
    ->     ROW_NUMBER() OVER (ORDER BY total_cost DESC) AS row_num,
    ->     RANK() OVER (ORDER BY total_cost DESC) AS rank_num,
    ->     DENSE_RANK() OVER (ORDER BY total_cost DESC) AS dense_rank_num,
    ->     PERCENT_RANK() OVER (ORDER BY total_cost DESC) AS pct_rank
    -> FROM (
    ->     SELECT
    ->         c.client_name,
    ->         SUM(s.cost) AS total_cost
    ->     FROM clients c
    ->     JOIN shipments s
    ->         ON c.client_id = s.client_id
    ->     GROUP BY c.client_name
    -> ) client_totals;

AGGREGATE FUNCTIONS
mysql> -- Student ID: 28966
mysql> -- Running total of shipment costs over time
mysql> SELECT
    ->     shipment_date,
    ->     cost,
    ->     SUM(cost) OVER (
    ->         ORDER BY shipment_date
    ->         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ->     ) AS running_total,
    ->     AVG(cost) OVER (
    ->         ORDER BY shipment_date
    ->         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ->     ) AS moving_avg_3_shipments
    -> FROM shipments;

NAVIGATION FUNCTIONS
mysql> -- Student ID: 28966
mysql> -- Shipment cost comparison using LAG and LEAD
mysql> SELECT
    ->     shipment_date,
    ->     cost,
    ->     LAG(cost) OVER (ORDER BY shipment_date) AS previous_cost,
    ->     LEAD(cost) OVER (ORDER BY shipment_date) AS next_cost,
    ->     cost - LAG(cost) OVER (ORDER BY shipment_date) AS cost_difference
    -> FROM shipments;

DISTRIBUTION FUNCTIONS
mysql> -- Student ID: 28966
mysql> -- Client segmentation using NTILE and CUME_DIST
mysql> SELECT
    ->     c.client_name,
    ->     SUM(s.cost) AS total_cost,
    ->     NTILE(4) OVER (ORDER BY SUM(s.cost) DESC) AS cost_quartile,
    ->     CUME_DIST() OVER (ORDER BY SUM(s.cost)) AS cumulative_distribution
    -> FROM clients c
    -> JOIN shipments s ON c.client_id = s.client_id
    -> GROUP BY c.client_name;
