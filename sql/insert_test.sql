DROP TABLE IF EXISTS insert_test_table;

CREATE TABLE insert_test_table (
    id int primary key ,
    name varchar(60),
    num int
);

INSERT INTO insert_test_table (id,name, num)
SELECT  i, to_char(i,'0999999') , i * 10
FROM generate_series(1, 10000000) AS s(i);