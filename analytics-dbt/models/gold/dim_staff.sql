SELECT 
    staff_id,
    first_name,
    last_name,
    address_id,
    email,
    active,
    store_id,
    username,
    staff_password,
    valid_from as last_update,
    picture
FROM {{ ref('his_staff') }}
WHERE is_current = true