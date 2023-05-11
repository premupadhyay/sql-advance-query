CREATE TABLE store (
	id INT NOT NULL PRIMARY KEY,
	country CHAR(25),
	city CHAR(25),
	opening_day DATE,
	rating int
);

INSERT INTO store 
	(id, country, city, opening_day, rating) VALUES
	(1,'Spain','Madrid','30-05-2014',5),
(2,	'Spain',	'Barcelona',	'28-07-2015'	,3),
(3	,'Spain'	,'Valencia'	,'13-12-2014'	,2),
(4,	'France',	'Paris',	'05-12-2014',	5),
(5,	'France',	'Lyon',	'24-09-2014',	3),
(6,'France',	'Nice',	'15-03-2014',	2),
(7,	'France','Bordeaux',	'29-07-2015',	1),
(8,	'Germany',	'Berlin',	'15-12-2014',	3),
(9,	'Germany'	,'Hamburg',	12-06-2015,	3),
(10,	'Germany','Frankfurt',	14-03-2015,	4);



CREATE TABLE sales (
	store_id int   ,
	revenue decimal(5,3),
	transactions int,
	day DATE,
	customers int,
    FOREIGN KEY(store_id) REFERENCES store(id)
);

INSERT INTO sales 
	(store_id, revenue, transactions, day, customers) VALUES

(1,	'01-08-2016',	6708.16	,77	,1465),
(1,	'02-08-2016'	,3556	,36	,762),
(1,	'03-08-2016',	2806.82,	30,	650),
(1	,'04-08-2016'	,6604.8	,103	,1032),
(1,	'05-08-2016'	,6409.46	,66	,859),
(1,	'06-08-2016',	6909.54	,123	,1604),
(1,	'07-08-2016'	,5596.67	,61,	730),
(1,	'08-08-2016'	,4254.43	,63	,1439),
(1,	'09-08-2016'	,2872.62	,30	,635),
(1,	'10-08-2016'	,2715.27,	48	,524),
(1,	'11-08-2016'	,3475.64,	64	,1416),
(1,	'12-08-2016'	,4049.45,	47	,1024),
(1,	'13-08-2016'	,3211.2,	33,	669),
(1	,'14-08-2016'	,1502.08	,30	,721),
(2	,'01-08-2016',	4828	,71,	1704),
(2	,'02-08-2016'	,17056	,213,	2132),
(2	,'03-08-2016'	,7209.78	,108	,2475),
(2	,'04-08-2016'	,12473.08	,166	,2162),
(2	,'05-08-2016'	,8070	,147	,1614),
(2,'06-08-2016',	8220,	137,	1781);

select * from sales;

/* Take into account the period between August 10 and August 14, 2016. For each row of sales,
  show the following information: store_id, day, number of customers and the rank
 based on the number of customers in the particular store */

select store_id, day, customers,
	rank() over(partition by store_id order by customers)
from sales
where day between '2016-08-10' and '2016-08-14';


