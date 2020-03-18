USE sakila;
/*MOSTRA TODAS AS TABELAS E QUAIS SÃO VIEW*/
SHOW FULL TABLES;


SELECT  TRIGGER_NAME AS 'TRIGGER',
        TRIGGER_SCHEMA AS BANCO,
        EVENT_MANIPULATION AS EVENT,
        ACTION_TIMING,
        EVENT_OBJECT_TABLE AS 'TARGET TABLE'
FROM TRIGGERS
WHERE TRIGGER_SCHEMA = 'sakila';


/*VIEWS*/
mysql> DESC actor_info;
+------------+-------------------+------+-----+---------+-------+
| Field      | Type              | Null | Key | Default | Extra |
+------------+-------------------+------+-----+---------+-------+
| actor_id   | smallint unsigned | NO   |     | 0       |       |
| first_name | varchar(45)       | NO   |     | NULL    |       |
| last_name  | varchar(45)       | NO   |     | NULL    |       |
| film_info  | text              | YES  |     | NULL    |       |
+------------+-------------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

SELECT  actor_id,
        first_name,
        last_name,
        film_info
FROM actor_info;


mysql> DESC staff_list;
+----------+------------------+------+-----+---------+-------+
| Field    | Type             | Null | Key | Default | Extra |
+----------+------------------+------+-----+---------+-------+
| ID       | tinyint unsigned | NO   |     | 0       |       |
| name     | varchar(91)      | YES  |     | NULL    |       |
| address  | varchar(50)      | NO   |     | NULL    |       |
| zip code | varchar(10)      | YES  |     | NULL    |       |
| phone    | varchar(20)      | NO   |     | NULL    |       |
| city     | varchar(50)      | NO   |     | NULL    |       |
| country  | varchar(50)      | NO   |     | NULL    |       |
| SID      | tinyint unsigned | NO   |     | NULL    |       |
+----------+------------------+------+-----+---------+-------+

SELECT  ID,
        name,
        address,
        'zip code',
        phone,
        city,
        country,
        SID
FROM staff_list;


