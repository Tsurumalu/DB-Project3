DROP TABLE IF EXISTS transaction_test_table;

CREATE TABLE transaction_test_table (
    id int primary key ,
    name varchar(60),
    num int
);

INSERT INTO transaction_test_table (id,name, num)
SELECT  i, 'Test User'|| i , i * 10
FROM generate_series(1, 100000) AS s(i);
BEGIN;
SELECT COUNT(*) FROM transaction_test_table WHERE transaction_test_table.num = 75000;
--
SELECT id,name,num FROM transaction_test_table WHERE transaction_test_table.num BETWEEN 500 AND 5000;
--
INSERT INTO transaction_test_table (id,name, num)
VALUES (100001,'New User', (random() * 1000)::INT);
--
INSERT INTO transaction_test_table (id,name, num)
VALUES (100002,'New User', (random() * 1000)::INT);

UPDATE transaction_test_table SET num = num + 100 WHERE num = 12130;

DELETE FROM transaction_test_table
WHERE id IN (SELECT id FROM transaction_test_table WHERE num < 100 LIMIT 100);
COMMIT