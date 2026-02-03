-- Check if all rental_id in Silver layer appear in Fact table
SELECT *
FROM {{ ref('fact_rental') }} as silver
LEFT JOIN {{ ref('his_rental') }} as gold
WHERE gold.rental_id is null