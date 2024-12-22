DROP TABLE IF EXISTS query_test_table;

CREATE TABLE query_test_table (
    id int primary key ,
    name varchar(60),
    num int
);

INSERT INTO query_test_table (id,name, num)
SELECT  i, 'Test User'|| i , i * 10
FROM generate_series(1, 100000) AS s(i);


BEGIN;
-- SELECT name FROM query_test_table WHERE query_test_table.id = 12345;

-- SELECT id, name, num FROM query_test_table WHERE query_test_table.id > 75000;

-- SELECT id, name, num FROM query_test_table WHERE query_test_table.id > 75000 AND query_test_table.num BETWEEN 500 AND 5000;

SELECT COUNT(*) FROM query_test_table WHERE query_test_table.num > 75000;

SELECT AVG(num) FROM query_test_table WHERE query_test_table.num BETWEEN 500 AND 5000;

SELECT id, name, num FROM query_test_table ORDER BY query_test_table.num DESC LIMIT 300;

COMMIT;
