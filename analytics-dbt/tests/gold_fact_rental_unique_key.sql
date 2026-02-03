-- Fails if (rental_id, payment_id) combination is not unique
select
    rental_id,
    payment_id,
    count(*) as cnt
from {{ ref('fact_rental') }}
group by rental_id, payment_id
having count(*) > 1
