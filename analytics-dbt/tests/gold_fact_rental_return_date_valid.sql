-- Fails if return_date is earlier than rental_date
select
    rental_id,
    payment_id,
    rental_date,
    return_date
from {{ ref('fact_rental') }}
where return_date is not null
  and return_date < rental_date
