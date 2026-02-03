-- Fails if any payment amount is negative
select
    payment_id,
    amount
from {{ ref('stg_payment') }}
where amount < 0
