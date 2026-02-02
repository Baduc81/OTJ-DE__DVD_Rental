select
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    valid_from,
    file_name
from {{ source('dvd_rental', 'payment_strm') }}