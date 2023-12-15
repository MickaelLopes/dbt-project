with source as (
    select *
    from {{ source('source', 'payments') }}
),
renamed as (
    select payment_id, 
            order_id, 
            payment_method
        from source
)
select *
from renamed
