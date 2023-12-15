with source as (
    select *
    from {{ ref('customers_snapshot')}}
),
renamed as (
    select customer_id,
           first_name,
           last_name,
           email,
           gender,
           city,
           race,
           current_customer_status,
           last_modified_date::TIMESTAMP as last_modified_date,
           created_date::TIMESTAMP as created_date,
           dbt_valid_from, 
           dbt_valid_to
        from source
)
select *
from renamed
