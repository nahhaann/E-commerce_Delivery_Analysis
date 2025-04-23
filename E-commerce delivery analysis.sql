create database project;

select * from jiomart;
select * from swiggy_instamart;
select * from blinkit;

create table swiggy_instamart (order_id varchar(50),customer_id varchar(50),platform varchar(50),ordered_time varchar(50),delivery_time double,product_category varchar(50),order_value int,customer_feedback varchar(100),service_rating int,delivery_delay varchar(10),refund_requested varchar(10));
create table blinkit (order_id varchar(50),customer_id varchar(50),platform varchar(50),ordered_time varchar(50),delivery_time double,product_category varchar(50),order_value int,customer_feedback varchar(100),service_rating int,delivery_delay varchar(10),refund_requested varchar(10));

delimiter $$
create trigger ab
after delete on jiomart
for each row begin
insert into swiggy_instamart (order_id,customer_id,platform,ordered_time,delivery_time,product_category,order_value,customer_feedback,service_rating,delivery_delay,refund_requested) values (old.order_id,old.customer_id,old.platform,old.ordered_time,old.delivery_time,old.product_category,old.order_value,old.customer_feedback,old.service_rating,old.delivery_delay,old.refund_requested);
end $$
delimiter ;

delete from jiomart where platform="Swiggy Instamart";


delimiter $$
create trigger zx
after delete on jiomart
for each row begin
insert into blinkit (order_id,customer_id,platform,ordered_time,delivery_time,product_category,order_value,customer_feedback,service_rating,delivery_delay,refund_requested) values (old.order_id,old.customer_id,old.platform,old.ordered_time,old.delivery_time,old.product_category,old.order_value,old.customer_feedback,old.service_rating,old.delivery_delay,old.refund_requested);
end $$
delimiter ;

delete from jiomart where platform="Blinkit";



select * from swiggy_instamart;
delete from swiggy_instamart where platform = "Blinkit";