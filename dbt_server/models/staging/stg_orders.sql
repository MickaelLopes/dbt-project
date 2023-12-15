with source as (
    select *
    from {{ source('source', 'orders') }}
),
renamed as (
    select order_id, 
        customer_id, 
        delivery_date::TIMESTAMP,
        order_date::TIMESTAMP,
        product_id, 
        quantity,
        price,
        cost_price_per_unit, 
        price - (cost_price_per_unit* quantity) as benefit,
        CONCAT(UPPER(LEFT(customer_status,1)), LOWER(SUBSTRING(customer_status,2,LENGTH(customer_status)))) as order_status
        from source
)
select *
from renamed

