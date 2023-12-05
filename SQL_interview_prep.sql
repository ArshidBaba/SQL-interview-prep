create table branch_mstr("branch_no" varchar(10), "name" varchar(25));

insert into branch_mstr (branch_no, name) values('B1', 'Vile Parle (HO)');
insert into branch_mstr (branch_no, name) values('B2', 'Andheri');
insert into branch_mstr (branch_no, name) values('B3', 'Chruchgate');
insert into branch_mstr (branch_no, name) values('B4', 'Sion');
insert into branch_mstr (branch_no, name) values('B5', 'Borivali');
insert into branch_mstr (branch_no, name) values('B6', 'Matunga');

select * from branch_mstr;
select * from branch_mstr where name='Andheri';

create table client_master("clientno" varchar(6), "name" varchar(20), 
						   "address1" varchar(30), "address2" varchar(30),
						   "city" varchar(15), "pincode" integer, 
						   "state" varchar(15),
						  "baldue" float);
drop table client_master;

select * from client_master;

create table product_master("productno" varchar(6), 
							"description" varchar(15), "profitpercent" numeric(4,2),
						   "unitmeasure" varchar(10), "qtyonhand" integer,
						   "reorderlvl" integer, "sellprice" numeric(8,2), 
							"costprice" numeric(8,2));
							
create table salesman_master("salesmanno" varchar(6), "salesmanname" varchar(20),
							"address1" varchar(30), "address2" varchar(30), 
							 "city" varchar(20), "pincode" integer, "state" varchar(20),
							"salamt" numeric(8,2), "tgttoget" numeric(6,2), 
							 "ytdsales" numeric(6,2), "remarks" varchar(60));
							 
select * from salesman_master;

insert into client_master ("clientno", "name", "city", "pincode", 
						   "state", "baldue") values('C00006', 'Deepak Sharma', 'Mangalore', 560050, 
								 'Karnataka', 0);
truncate table client_master;

select * from client_master;

insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P07868', 'Trousers', 2, 
												'Piece', 150, 50, 850, 550); 
												
select * from product_master;

select * from branch_mstr;
drop table product_master;
create table product_master("productno" varchar(6)check(productno like 'P%'), 
							"description" varchar(15), "profitpercent" numeric(4,2),
						   "unitmeasure" varchar(10), "qtyonhand" integer,
						   "reorderlvl" numeric(8), "sellprice" numeric(8,2)not null, 
							"costprice" numeric(8,2)not null, primary key(productno), 
							check(costprice!=0), check(sellprice!=0));
							
select * from product_master;

select * from client_master;

create table salesman_master("salesmanno" varchar(6), "salesmanname" varchar(20)not null,
							"address1" varchar(30)not null, "address2" varchar(30), 
							 "city" varchar(20), "pincode" integer, "state" varchar(20),
							"salamt" numeric(8,2)not null, "tgttoget" numeric(6,2)not null, 
							 "ytdsales" numeric(6,2)not null, "remarks" varchar(60), primary key(salesmanno),
							check(salesmanno like 'S%'), check(salamt !=0), check(tgttoget !=0));
							
select * from salesman_master;

drop table sales_order;
create table sales_order("orderno" varchar(6)check(orderno like 'O%'), "clientno" varchar(6)references client_master,
						"orderdate" date not null, "delyaddr" varchar(25), "salesmanno" varchar(6)references salesman_master,
						"delytype" char(1)default('F'), "billyn" char(1), "delydate" date,
						"orderstatus" varchar(10)check(orderstatus in ('In Process', 'Fulfilled',
																	   'BackOrder', 'Cancelled')),  
						 constraint check_delydate_orderdate check(delydate >= orderdate),
						 primary key(orderno));
						 
drop table sales_order_details;
create table sales_order_details("orderno" varchar(6)references sales_order, "productno" varchar(6)references product_master, "qtyordered" numeric(8), "qtydisp"
								numeric(8), "productrate" numeric(10,2));

select * from product_master;

select * from client_master;

select * from salesman_master;

select * from sales_order;

select * from sales_order_details;

insert into client_master ("clientno", "name", "city", "pincode", 
						   "state", "baldue") values('C00001', 'Ivan Bayross', 'Mumbai', 400054, 
								 'Maharashtra', 15000);
insert into client_master ("clientno", "name", "city", "pincode", 
						   "state", "baldue") values('C00002', 'Mamta Muzumdar', 'Madras', 780001, 
								 'Tamil Nadu', 0);
								 
insert into client_master ("clientno", "name", "city", "pincode", 
						   "state", "baldue") values('C00003', 'Chhaya Bankar', 'Mumbai', 400057, 
								 'Maharashtra', 5000);
								 
insert into client_master ("clientno", "name", "city", "pincode", 
						   "state", "baldue") values('C00004', 'Ashwini Joshi', 'Bangalore', 560001, 
								 'Karnataka', 0);
insert into client_master ("clientno", "name", "city", "pincode", 
						   "state", "baldue") values('C00005', 'Hansel Colaco', 'Mumbai', 400060, 
								 'Maharashtra', 2000);
								 
insert into client_master ("clientno", "name", "city", "pincode", 
						   "state", "baldue") values('C00006', 'Deepak Sharma', 'Mangalore', 560050, 
								 'Karnataka', 0);
								 
insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P00001', 'T-Shirts', 5, 
												'Piece', 200, 50, 350, 250); 
												
alter table product_master add constraint ch_pno check(productno like 'P%');

insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P0345', 'Shirts', 6, 
												'Piece', 200, 50, 350, 250); 

insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P06734', 'Cotton Jeans', 5, 
												'Piece', 100, 20, 600, 450);
												
insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P07865', 'Jeans', 5, 
												'Piece', 100, 20, 750, 500); 
												
insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P07868', 'Trousers', 2, 
												'Piece', 150, 50, 850, 550);
												
insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P07885', 'Pull Overs', 2.5, 
												'Piece', 80, 30, 700, 450);
												
insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P07965', 'Denim Shirts', 4, 
												'Piece', 100, 40, 350, 250);
												
insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P07975', 'Lycra Tops', 5, 
												'Piece', 70, 30, 300, 175); 
												
insert into product_master ("productno", "description", "profitpercent", 
							"unitmeasure", "qtyonhand", 
							 "reorderlvl", "sellprice", 
							"costprice") values('P08865', 'Skirts', 5, 
												'Piece', 75, 30, 450, 300); 												
												
select * from product_master;

select * from client_master;

select * from salesman_master;

select * from sales_order;

select * from sales_order_details;				
				
insert into salesman_master("salesmanno", "salesmanname", "address1", "address2", "city", "pincode", "state",
						   "salamt", "tgttoget", "ytdsales", "remarks") values('S00001', 'Aman', 'A/14', 'Worli',
																			  'Mumbai', 400002, 'Maharashtra',
																			  3000, 100, 50, 'Good');	
																			  
insert into salesman_master("salesmanno", "salesmanname", "address1", "address2", "city", "pincode", "state",
						   "salamt", "tgttoget", "ytdsales", "remarks") values('S00002', 'Omkar', '65', 'Nariman',
																			  'Mumbai', 400001, 'Maharashtra',
																			  3000, 200, 100, 'Good');
																			  
insert into salesman_master("salesmanno", "salesmanname", "address1", "address2", "city", "pincode", "state",
						   "salamt", "tgttoget", "ytdsales", "remarks") values('S00003', 'Raj', 'P-7', 'Bandra',
																			  'Mumbai', 400032, 'Maharashtra',
																			  3000, 200, 100, 'Good');	
																			  
insert into salesman_master("salesmanno", "salesmanname", "address1", "address2", "city", "pincode", "state",
						   "salamt", "tgttoget", "ytdsales", "remarks") values('S00004', 'Ashish', 'A/5', 'Juhu',
																			  'Mumbai', 400044, 'Maharashtra',
																			  3500, 200, 150, 'Good');																			  
				
drop table sales_order;
drop table sales_order_details;

insert into sales_order("orderno", "clientno", "orderdate", "salesmanno", "delytype", "billyn", "delydate",
						   "orderstatus")values ('O19001', 'C00001', '12-June-02', 'S00001', 'F', 'N', '20-July-02',
												'In Process');
												
insert into sales_order("orderno", "clientno", "orderdate", "salesmanno", "delytype", "billyn", "delydate",
						   "orderstatus")values ('O19002', 'C00002', '25-June-02', 'S00002', 'P', 'N', '27-June-02',
												'Cancelled');		
												
insert into sales_order("orderno", "clientno", "orderdate", "salesmanno", "delytype", "billyn", "delydate",
						   "orderstatus")values ('O19002', 'C00002', '25-June-02', 'S00002', 'P', 'N', '27-June-02',
												'Cancelled');
												
insert into sales_order("orderno", "clientno", "orderdate", "salesmanno", "delytype", "billyn", "delydate",
						   "orderstatus")values ('O46865', 'C00003', '18-Feb-02', 'S00003', 'F', 'Y', '20-Feb-02',
												'Fulfilled');	
												
insert into sales_order("orderno", "clientno", "orderdate", "salesmanno", "delytype", "billyn", "delydate",
						   "orderstatus")values ('O19003', 'C00001', '03-Apr-02', 'S00001', 'F', 'Y', '07-Apr-02',
												'Fulfilled');
												
insert into sales_order("orderno", "clientno", "orderdate", "salesmanno", "delytype", "billyn", "delydate",
						   "orderstatus")values ('O46866', 'C00004', '20-May-02', 'S00002', 'P', 'N', '22-May-02',
												'Cancelled');
												
insert into sales_order("orderno", "clientno", "orderdate", "salesmanno", "delytype", "billyn", "delydate",
						   "orderstatus")values ('O19008', 'C00005', '24-May-02', 'S00004', 'F', 'N', '26-July-02',
												'In Process');	
												


insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19001', 'P00001', 4, 4, 525);
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19001', 'P07965', 2, 1, 8400);								 

insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19001', 'P07885', 2, 1, 5250);
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19002', 'P00001', 10, 0, 525);
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O46865', 'P07868', 3, 3, 3150);
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O46865', 'P07885', 3, 1, 5250);	
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O46865', 'P00001', 10, 10, 525);	
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O46865', 'P0345', 4, 4, 1050);
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19003', 'P0345', 2, 2, 1050);	
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19003', 'P06734', 1, 1, 12000);	
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O46866', 'P07965', 1, 0, 8400);
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O46866', 'P07975', 1, 0, 1050);				
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19008', 'P00001', 10, 5, 525);
								 
insert into sales_order_details ("orderno", "productno", "qtyordered", 
								 "qtydisp", "productrate") values('O19001', 'P07975', 5, 3, 1050);	
								 
delete from sales_order_details where orderno='O19001' and productno='P07975';

select * from client_master;

select name from client_master where name like '_a%';

select * from client_master where city like 'M%';

select * from client_master where city='Bangalore' or city='Mangalore';

select * from client_master where baldue > 10000;

select * from sales_order where to_char(orderdate, 'MM')='June'; 

select * from sales_order where extract(month from orderdate) = 06;

select * from sales_order;

select * from sales_order where clientno='C00001' or clientno='C00002';

select * from product_master;

select * from product_master where sellprice > 500 and sellprice<=750;

select *, sellprice+(sellprice*0.15) new_price from product_master where sellprice > 500;

select name, city, state from client_master where state !='Maharashtra';

-- select count(orderno) 'No of Orders' from sales_order;

select count(*) as order_count from sales_order;

select avg(costprice) as average_cost from product_master;

select min(sellprice) "min_price", max(sellprice) "max_price" from product_master;

select count(*) from product_master where sellprice <=500;

select *from product_master where qtyonhand < reorderlvl;

select orderno, orderdate from sales_order;

select extract(month from orderdate) as month, delydate from sales_order;

extract(month from orderdate) = 06

select * from sales_order;

select to_char(orderdate, 'Month'), delydate from sales_order;

select to_char(orderdate, 'DD-Month-YY') from sales_order;

select current_date + 15 as future;





