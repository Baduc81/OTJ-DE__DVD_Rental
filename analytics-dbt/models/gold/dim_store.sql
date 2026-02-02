SELECT
    store_id,
    manager_staff_id,
    valid_from as last_update
FROM {{ ref('his_store') }}
WHERE is_current = true