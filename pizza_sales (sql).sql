select * from pizza_sales;

select count(pizza_id)
from pizza_sales;

-- 1. Total Revenue
select sum(total_price) as Total_Revenue
from pizza_sales;

-- 2. Average Order Value
select sum(total_price)/count(distinct(order_id)) as Average_Order_Value
from pizza_sales;

-- 3. Total Pizzas Sold
select sum(quantity) as  Total_Pizzas_Sold
from pizza_sales;

-- 4. Total Orders
select count(distinct(order_id)) as Total_Orders
from pizza_sales;

-- 5. Average Pizzas Per Order
select sum(quantity) /count(distinct(order_id)) as Average_Pizzas_Per_Order
from pizza_sales;


-- B. Daily Trend for Total Orders
select dayname(str_to_date(order_date,'%d-%m-%y')) as order_day,count(distinct(order_id)) as total_orders
from pizza_sales
group by dayname(str_to_date(order_date,'%d-%m-%y'))
order by total_orders desc;


-- C. Hourly Trend for Orders
select hour(order_time) as order_hours, count(distinct(order_id)) as total_orders
from pizza_sales
group by order_hours;


-- D. % of Sales by Pizza Category
select pizza_category, round(sum(total_price)*100/ (select sum(total_price) from pizza_sales),2) as PCT_sales
from pizza_sales
group by pizza_category;

-- E. % of Sales by Pizza Size
select pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as PCT_sales
from pizza_sales
group by pizza_size
order by PCT_sales desc;


-- F. Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as Total_Quantity_Sold
from pizza_sales
group by pizza_category
order by Total_Quantity_Sold desc;

-- G. Top 5 Best Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold desc
limit 5;


-- H. Bottom 5 Best Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold
limit 5;










