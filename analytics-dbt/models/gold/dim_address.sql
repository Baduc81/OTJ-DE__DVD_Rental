WITH city_country AS (
    SELECT
        _city.city_id,
        _city.city,
        _city.country_id,
        _country.country,
        GREATEST(_city.valid_from, _country.valid_from) as last_update
    FROM {{ ref('his_city') }} AS _city
    LEFT JOIN {{ ref('his_country') }} AS _country
    ON _city.country_id = _country.country_id
),
detailed_address AS (
    SELECT
        _address.address_id,
        _address.address,
        _address.address2,
        city_country.city,
        city_country.country,
        _address.postal_code,
        _address.phone,
        GREATEST(_address.valid_from, city_country.last_update) as last_update
    FROM {{ ref('his_address') }} AS _address
    LEFT JOIN city_country
    ON _address.city_id = city_country.city_id
)
SELECT * FROM detailed_address