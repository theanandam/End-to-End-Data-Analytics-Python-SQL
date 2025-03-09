




select * FROM df_orders

--top 10 sales
select top 10 product_id, sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc

--top 5 selling products in each reqion
select distinct region from df_orders
with cte as(
select region, product_id , sum(sale_price) as sales
from df_orders
group by region,product_id)
select * from (
select *
, ROW_NUMBER() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5


--MOM comparision  2022 - 2023

