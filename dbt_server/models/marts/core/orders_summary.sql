with orders as (
    select *
    from {{ ref('stg_orders')}}
),
renamed as( 
    select order_id,
           order_date::TIMESTAMP, 
           price, 
           benefit,
           date_part('month',order_date) as order_month, 
           date_part('year',order_date) as order_year,
           order_status
    from orders
),
total_orders as (
select order_year, order_month , 
        SUM(price) as month_sales, 
        count(order_id) as total_orders, 
        SUM(benefit) as month_benefit
from renamed
group by order_year, order_month
),
silver_orders as ( 
    select order_year, order_month, count(order_id) as silver_orders, sum(price) as silver_sales
    from renamed
    where order_status = 'Silver'
    group by order_year, order_month
    ),
gold_orders as ( 
    select order_year, order_month, count(order_id) as gold_orders, sum(price) as gold_sales
    from renamed
    where order_status = 'Gold'
    group by order_year, order_month
    ),
plat_orders as ( 
    select order_year, order_month, count(order_id) as platinum_orders, sum(price) as platinum_sales
    from renamed
    where order_status = 'Platinum'
    group by order_year, order_month
    ),
status_orders_sg as (
    select g.order_year, g.order_month, g.gold_orders, g.gold_sales, s.silver_orders, s.silver_sales
    from gold_orders as g INNER JOIN silver_orders as s
    on g.order_year = s.order_year AND g.order_month = s.order_month),
status_orders as (
    select p.order_year, p.order_month, s.gold_orders, s.gold_sales, s.silver_orders, s.silver_sales, p.platinum_orders, p.platinum_sales
    from status_orders_sg as s INNER JOIN plat_orders as p
    on p.order_year = s.order_year AND p.order_month = s.order_month)
    

select t.order_year, t.order_month, t.month_sales, t.total_orders, t.month_benefit, 
       s.silver_orders, s.silver_sales, s.gold_orders, s.gold_sales, s.platinum_orders, s.platinum_sales
from total_orders as t INNER JOIN status_orders as s
on t.order_year = s.order_year AND t.order_month = s.order_month
order by t.order_year DESC , t.order_month ASC