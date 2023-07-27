select * from pizza_sales
/*Total Revenue*/
select round(sum(total_price),2) as total_Revenue from pizza_sales

/*Average order value*/

select round(sum(total_price)/count(distinct order_id),5)as Average_order_value from pizza_sales

select sum(total_price)/count(distinct order_id) from pizza_sales

/*Total pizza sold*/

select sum(quantity) as total_pizza_sold from pizza_sales

/*Total orders */
select count(distinct order_id) as Total_order_placed from pizza_sales

/*Average pizza per order*/

select cast(cast(sum(quantity) as decimal(10,2)) /
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))as Average_Pizza_per_order from pizza_sales

/*Daily Trend total orders*/

select DATENAME(DW, order_date) as order_per_day,count(distinct(order_id))as Total_order from pizza_sales
group by DATENAME(DW, order_date)



select * from pizza_sales

select DATEPART(hour ,order_time)as Hour_order_trend,count(distinct order_id)as Total_orders from pizza_sales
group by DATEPART(hour ,order_time)
order by DATEPART(hour ,order_time)

/*Perntage sale by pizza cateogry*/

select pizza_category,sum(total_price)*100/(select sum(total_price)as total_sale from pizza_sales where month(order_date)=1)as percentage_sale from pizza_sales
where month(order_date)=1
group by pizza_category

/*Perntage sale by pizza size*/

select pizza_size,sum(total_price)*100/(select sum(total_price) from pizza_sales where DATEPART(quarter,order_date)=1) as pct from pizza_sales
where DATEPART(quarter,order_date)=1
group by pizza_size
order by pct desc

/*Total pizza sold by pizza cattgory*/

select pizza_category,sum(quantity)as Total_pizza_sale from pizza_sales
group by pizza_category

/*Top 5 best seller by total pizza sold*/

select top 5 pizza_name,sum(quantity)as total_sale from pizza_sales
group by pizza_name
order by total_sale  desc


/*Bottom 5 best seller by total pizza sold*/
select top 5 pizza_name,sum(quantity)as total_sold from pizza_sales
group by pizza_name
order by total_sold
