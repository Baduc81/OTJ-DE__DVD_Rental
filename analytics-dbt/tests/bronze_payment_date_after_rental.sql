-- Fails if payment date is earlier than rental date
select
    p.payment_id,
    p.rental_id,
    p.valid_from as payment_date,
    r.rental_date
from {{ ref('stg_payment') }} p
join {{ ref('stg_rental') }} r
  on p.rental_id = r.rental_id
where p.valid_from < r.rental_date
