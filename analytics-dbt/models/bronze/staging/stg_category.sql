select 
    category_id,
    category_name,
    valid_from,
    file_name
from {{ source('dvd_rental', 'category_strm') }}