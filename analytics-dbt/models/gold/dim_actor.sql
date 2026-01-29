SELECT 
    actor_id,
    first_name,
    last_name,
    valid_from as last_update
FROM {{ ref('his_actor') }}
WHERE is_current = true