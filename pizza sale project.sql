create database pizza_sale;
use pizza_sale;
select * from pizza_restraunt_sale;
set sql_safe_updates=0;

-- total revenue
select sum(total_price) as total_revenue from pizza_restraunt_sale;

-- Average order value
select (sum(total_price))/count(distinct(order_id)) as average_order_value from pizza_restraunt_sale;

-- Total pizzas sold
select sum(quantity) as Total_pizzas_sold from pizza_restraunt_sale;

-- Total Orders
select count(distinct(order_id)) as Total_orders from pizza_restraunt_sale;

-- Average pizzas per order
select round( (sum(quantity))/(count(distinct order_id)) ,2) as avg_pizzas_order from pizza_restraunt_sale;

-- daily trend for total orders
select day (order_date) as order_day,count(distinct order_id) as total_orders from pizza_restraunt_sale group by day(order_date);

-- Hourly trend for orders
select hour(order_time) as order_hour,count(distinct order_id) as total_orders from pizza_restraunt_sale group by hour(order_time)order by order_hour;


-- % of sales by pizz category
select pizza_category,round(sum(total_price),2) as Total_Revenue ,round((sum(total_price))*100/(select sum(total_price) from pizza_restraunt_sale),2) as percentage from pizza_restraunt_sale group by pizza_category;

-- % of sales by pizza size
select pizza_size,round(sum(total_price),2) as Total_Revenue ,
round((sum(total_price))*100/(select sum(total_price) from pizza_restraunt_sale),2) as percentage 
from pizza_restraunt_sale
 group by pizza_size 
 order by pizza_size;
 
 -- Total Orders by Pizza Category 
 select pizza_category,sum(quantity)as total_qty_sold
 from pizza_restraunt_sale
 where month(order_date)=2
 group by pizza_category
 order by Total_qty_sold desc;
 
 -- Top 5 best seller by total pizza sold
 select pizza_name, sum(quantity) as TOTAL_PIZZA_SOLD from pizza_restraunt_sale
 group by Pizza_name order by SUM(quantity) desc limit 5;
 
 -- Bottom 5 best seller by total pizza sold 
select pizza_name, sum(quantity) as TOTAL_PIZZA_SOLD from pizza_restraunt_sale
 group by Pizza_name order by SUM(quantity)  limit 5;
 
 
 









