-- Use the ngo_db database
USE ngo_db;

-- Query 1: Track Donations
SELECT "=== Track Donations: Communities and Items ===" AS '';
SELECT c.community_name, d.item_name, d.item_type, d.donation_date, d.status
FROM Donations d
JOIN Communities c ON d.community_id = c.community_id;
SELECT SLEEP(1);

-- Query 2: Track Remaining Items
SELECT "=== Track Remaining Items ===" AS '';
SELECT item_name, item_type, remaining_quantity, status
FROM Donations
WHERE remaining_quantity IS NOT NULL;
SELECT SLEEP(1);

-- Query 3: Donations by Donor
SELECT "=== Donations by Donor ===" AS '';
SELECT u.name AS donor_name, d.item_name, d.item_type, d.donation_date, d.status
FROM Donations d
JOIN Users u ON d.user_id = u.user_id
WHERE u.role = 'donor';
SELECT SLEEP(1);

-- Query 4: Community Donation History
SELECT "=== Community Donation History ===" AS '';
SELECT c.community_name, d.item_name, d.item_type, d.donation_date, d.status
FROM Donations d
JOIN Communities c ON d.community_id = c.community_id
WHERE c.community_id = 1; -- Example: Filtering for a specific community by ID
SELECT SLEEP(1);

-- Query 5: Donations Received by Each Community
SELECT "=== Donations Received by Each Community ===" AS '';
SELECT c.community_name, COUNT(d.donation_id) AS total_donations_received
FROM Donations d
JOIN Communities c ON d.community_id = c.community_id
WHERE d.status = 'received'
GROUP BY c.community_name;
SELECT SLEEP(1);

-- Query 6: Items Pending for a Specific Community
SELECT "=== Items Pending for a Specific Community ===" AS '';
SELECT c.community_name, d.item_name, d.quantity, d.remaining_quantity
FROM Donations d
JOIN Communities c ON d.community_id = c.community_id
WHERE d.status = 'pending' AND c.community_id = 2; -- Example: Filtering for a specific community by ID
SELECT SLEEP(1);
