## PL/SQL Window Functions Assignment And SQL JOINS

**Course:** Database Development with PL/SQL (INSY 8311)  
**Instructor:** Eric Maniraguha  
**Student:** Gisagara Dave Toussaint  
**Student ID:** 28966  

---

## Step 1: Problem Definition

### Business Context
A logistics and transport company operating across Rwanda, responsible for delivering goods between regions. The Operations Department tracks clients, delivery routes, and shipment transactions.

### Data Challenge
Management lacks visibility into shipment performance across regions, client activity levels, and monthly delivery trends. It is difficult to identify inactive clients, underutilized routes, and shipment growth patterns over time.

### Expected Outcome
Track shipment numbers, rank the performance of clients and routes, watch monthly trends, and sort clients by how much they ship, to help make better business choices.

---

## Step 2: Success Criteria

1. Identify top-performing clients per region using `RANK()`
2. Running monthly shipment totals using `SUM() OVER()`
3. Measure month over month shipment growth using `LAG()`
4. Divide clients into four activity quartiles using `NTILE(4)`
5. Calculate three-month moving averages using `AVG() OVER()`

---

## Step 3: Database Schema Design

### Clients
Stores company information.  
**Key Columns:** `client_id` (PK), `client_name`, `industry`, `region`

### Routes
Stores delivery route details.  
**Key Columns:** `route_id` (PK), `origin`, `destination`, `distance_km`

### Shipments
Records shipment transactions and links clients and routes.  
**Key Columns:** `shipment_id` (PK), `client_id` (FK), `route_id` (FK)

### Relationships

| Table     | Primary Key | Foreign Keys                                      |
|-----------|-------------|--------------------------------------------------|
| Clients   | client_id   | -                                                |
| Routes    | route_id    | -                                                |
| Shipments | shipment_id | client_id → clients(client_id), route_id → routes(route_id) |

![screenshot](ER Diagram/eer diagram.png)

---

## Step 4: Part A — SQL Joins Implementation

### 1. INNER JOIN
**Screenshot here**  
**Business interpretation:**  
This query shows all shipments where both the client and the route exist in the system. It highlights active shipments and ensures that only valid transactions are analyzed. Most shipments are concentrated among Kigali-origin routes, reflecting central hub activity.

### 2. LEFT JOIN
**Screenshot here**  
**Business interpretation:**  
This highlights inactive clients who haven't made any shipments yet. It helps management find accounts that need follow-ups or rewards to get them started.

### 3. RIGHT JOIN
**Screenshot here**  
**Business interpretation:**  
This identifies routes with little to no activity, such as long-distance paths without scheduled shipments. It helps management decide whether to promote these routes or remove them to save costs.

### 4. FULL OUTER JOIN (using MySQL it is simulated with LEFT JOIN + RIGHT JOIN with UNION)
**Screenshot here**  
**Business interpretation:**  
This report shows all clients and routes, even those without any activity. It helps management identify where to re-engage customers or improve route schedules.

### 5. SELF JOIN
**Screenshot here**  
**Business interpretation:**  
This report groups clients by region to find opportunities for combined shipping. It helps management consolidate routes or plan regional promotions more efficiently.

---

## Step 5: Part B — Window Functions Implementation

### 1. Ranking Functions
**Functions required:** `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `PERCENT_RANK()`  
**Use case:** Top clients by total shipment cost  
**Screenshot here**  
**Business Meaning:**  
This ranks clients by their total spending to identify your most valuable customers. It helps management see the performance gap between top-tier accounts and the rest of the list.

### 2. Aggregate Window Functions
**Functions required:** `SUM() OVER()`, `AVG() OVER()`  
**Frames:** ROWS  
**Use case:** Running total of shipment costs over time  
**Screenshot here**  
**Business Meaning:**  
The running total tracks total logistics costs over time, while the moving average hides small spikes to show the real trend. This makes it easier for management to monitor spending and predict future costs.

### 3. Navigation Functions
**Functions:** `LAG()`, `LEAD()`  
**Use case:** Compare shipment cost changes over time  
**Screenshot here**  
**Business Meaning:**  
This analysis compares each shipment’s cost to the ones before and after it to spot any changes. It helps management identify unusual price spikes or areas where money is being wasted.

### 4. Distribution Functions
**Functions:** `NTILE(4)`, `CUME_DIST()`  
**Use case:** Client segmentation by shipment spending  
**Screenshot here**  
**Business Meaning:**  
This analysis divides clients into four equal groups based on how much they spend. It allows management to customize pricing, rewards, and service levels for each specific group.

---

## Step 6: Results Analysis

### 1. Descriptive
What happened? A few key clients drive most of the shipping costs, and activity rose from January to February. Ranking data shows a clear gap between top-tier contributors and smaller accounts.

### 2. Diagnostic
Why did it happen? Top clients spend more because they use longer routes and ship more frequently. The February growth came from new shipments, while some empty routes suggest underused capacity.

### 3. Prescriptive
What should be done? Prioritize high-value clients with special service agreements while targeting inactive routes for marketing or adjustments. Use regular data tracking to guide future logistics planning.

---

## Step 7: References

1. Oracle MySQL Documentation. Window Functions in MySQL 8.0. https://dev.mysql.com/doc/refman/8.0/en/window-functions.html  
2. W3Schools. MySQL JOINs Tutorial. https://www.w3schools.com/sql/sql_join.asp  
3. GeeksforGeeks. SQL Window Functions with Examples. https://www.geeksforgeeks.org/sql-window-functions/  
4. PostgreSQL Documentation (for understanding window function concepts). https://www.postgresql.org/docs/current/tutorial-window.html  
5. AUCA INSY 8311 Course Materials – Database Development with PL/SQL, Instructor Eric Maniraguha.

---

## Step 8: Integrity Statement

All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.
