-- Fails if rental_rate or replacement_cost is negative
select
    rental_id,
    payment_id,
    film_id,
    rental_rate,
    replacement_cost
from {{ ref('fact_rental') }}
where rental_rate < 0 or replacement_cost < 0
