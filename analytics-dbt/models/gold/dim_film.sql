with detail_film_category_name as (
    SELECT 
        _film_category.film_id,
        _film_category.category_id,
        _category.category_name,
        GREATEST(_film_category.valid_from, _category.valid_from) as last_update
    FROM {{ ref('his_film_category') }} AS _film_category
    LEFT JOIN {{ ref('his_category') }} AS _category
    ON _film_category.category_id = _category.category_id
    WHERE _film_category.is_current = true and _category.is_current = true
),
detail_film_category as (
    SELECT
        _film.film_id,
        _film.title,
        _film.film_description,
        _film.release_year,
        _film.film_length,
        _film.rating,
        _film.special_features,
        _film.film_fulltext,
        detail_film_category_name.category_name,
        _film.language_id,
        GREATEST(_film.valid_from, detail_film_category_name.last_update) as last_update

    FROM {{ ref('his_film') }} as _film
    LEFT JOIN detail_film_category_name
    ON _film.film_id = detail_film_category_name.film_id
    WHERE _film.is_current = true
)
SELECT
    _film.film_id,
    _film.title,
    _film.film_description,
    _film.release_year,
    _film.film_length,
    _film.rating,
    _film.special_features,
    _film.film_fulltext,
    _film.category_name as film_category,
    _language.language_name as film_language,
    GREATEST(_film.last_update, _language.valid_from) as last_update
FROM detail_film_category as _film
LEFT JOIN {{ ref('his_language') }} as _language
ON _film.language_id = _language.language_id
WHERE _language.is_current = true