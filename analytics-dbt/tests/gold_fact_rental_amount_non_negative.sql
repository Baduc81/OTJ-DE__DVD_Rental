-- Fails if any rental amount is negative
select
    rental_id,
    payment_id,
    amount
from {{ ref('fact_rental') }}
where amount < 0
