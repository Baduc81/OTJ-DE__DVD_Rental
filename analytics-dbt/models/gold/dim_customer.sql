SELECT 
    customer_id,
    store_id,
    first_name,
    last_name,
    email,
    activebool,
    create_date as created_date,
    active,
    valid_from as last_update
FROM {{ ref('his_customer') }}
WHERE is_current = true