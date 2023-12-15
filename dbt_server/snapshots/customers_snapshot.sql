{% snapshot customers_snapshot %}

{{
    config(
        target_schema ='staging',
        strategy='timestamp',
        unique_key='customer_id',
        updated_at='last_modified_Date',
        invalidate_hard_deletes=True,
        )


}}

with source as (
    select *
    from {{ source('source', 'customers') }}
),
renamed as (
    select customer_id,
           first_name,
           last_name,
           email,
           gender,
           city,
           race,
           CONCAT(UPPER(LEFT(current_customer_status,1)), LOWER(SUBSTRING(current_customer_status,2,LENGTH(current_customer_status)))) as current_customer_status,
           last_modified_date,
           created_date
        from source
)

select * from renamed

{% endsnapshot %}
