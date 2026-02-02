WITH rental_payment AS (
    SELECT
        rental.rental_id,
        rental.rental_date,
        rental.inventory_id,
        rental.customer_id as rental_customer_id,
        rental.return_date,
        rental.staff_id as rental_staff_id,
        payment.payment_id,
        payment.customer_id as payment_customer_id,
        payment.staff_id as payment_staff_id,
        payment.amount,
        payment.valid_from as payment_date,
        GREATEST(rental.valid_from, payment.valid_from) as last_update
    FROM {{ ref('his_rental') }} as rental
    LEFT JOIN {{ ref('his_payment') }} as payment
    ON rental.rental_id = payment.rental_id
    WHERE rental.is_current = true and payment.is_current = true
),
rental_payment_inventory AS (
    SELECT 
        rental_payment.rental_id,
        rental_payment.rental_date,
        rental_payment.rental_customer_id,
        rental_payment.return_date,
        rental_payment.rental_staff_id,
        rental_payment.payment_id,
        rental_payment.payment_customer_id,
        rental_payment.payment_staff_id,
        rental_payment.amount,
        rental_payment.payment_date,
        inventory.store_id,
        inventory.film_id,
        GREATEST(rental_payment.last_update, inventory.valid_from) as last_update
    FROM rental_payment
    LEFT JOIN {{ ref('his_inventory') }} AS inventory
    ON rental_payment.inventory_id = inventory.inventory_id
    WHERE inventory.is_current = true
),
film_actor AS (
    SELECT 
        film.film_id,
        film.rental_duration,
        film.rental_rate,
        film.replacement_cost,
        fa.actor_id,
        GREATEST(film.valid_from, fa.valid_from) as last_update
    FROM {{ ref('his_film') }} as film
    LEFT JOIN {{ ref('his_film_actor') }} as fa ON film.film_id = fa.film_id
    WHERE film.is_current = true and fa.is_current = true
),
rental_payment_inventory_film AS (
    SELECT 
        rpi.rental_id,
        rpi.rental_date,
        rpi.rental_customer_id,
        rpi.return_date,
        rpi.rental_staff_id,
        rpi.payment_id,
        rpi.payment_customer_id,
        rpi.payment_staff_id,
        rpi.amount,
        rpi.payment_date,
        rpi.store_id,
        rpi.film_id,
        film.rental_duration,
        film.rental_rate,
        film.replacement_cost,
        film.actor_id,
        GREATEST(rpi.last_update, film.last_update) as last_update
    FROM rental_payment_inventory AS rpi
    LEFT JOIN film_actor as film ON rpi.film_id = film.film_id
    -- No need to check condition "is_current = true" because We've already checked it in above table
),
rental_payment_inventory_film_customer_address AS (
    SELECT 
        rpif.rental_id,
        rpif.rental_date,
        rpif.rental_customer_id,
        rpif.return_date,
        rpif.rental_staff_id,
        rpif.payment_id,
        rpif.payment_customer_id,
        rpif.payment_staff_id,
        rpif.amount,
        rpif.payment_date,
        rpif.store_id,
        rpif.film_id,
        rpif.rental_duration,
        rpif.rental_rate,
        rpif.replacement_cost,
        rpif.actor_id,
        customer_rental.address_id as customer_rental_address_id,
        customer_payment.address_id as customer_payment_address_id,
        GREATEST(rpif.last_update, customer_rental.valid_from, customer_payment.valid_from) as last_update
    FROM rental_payment_inventory_film AS rpif
    LEFT JOIN {{ ref('his_customer') }} AS customer_rental ON rpif.rental_customer_id = customer_rental.customer_id
    LEFT JOIN {{ ref('his_customer') }} AS customer_payment ON rpif.payment_customer_id = customer_payment.customer_id
    WHERE customer_rental.is_current = true and customer_payment.is_current = true
),
rental_payment_inventory_film_staff_address AS (
    SELECT 
        rpif.rental_id,
        rpif.rental_date,
        rpif.rental_customer_id,
        rpif.return_date,
        rpif.rental_staff_id,
        rpif.payment_id,
        rpif.payment_customer_id,
        rpif.payment_staff_id,
        rpif.amount,
        rpif.payment_date,
        rpif.store_id,
        rpif.film_id,
        rpif.rental_duration,
        rpif.rental_rate,
        rpif.replacement_cost,
        rpif.actor_id,
        rpif.customer_rental_address_id,
        rpif.customer_payment_address_id,
        staff_rental.address_id as staff_rental_address_id,
        staff_payment.address_id as staff_payment_address_id,
        GREATEST(rpif.last_update, staff_rental.valid_from, staff_payment.valid_from) as last_update
    FROM rental_payment_inventory_film_customer_address AS rpif
    LEFT JOIN {{ ref('his_staff') }} AS staff_rental ON rpif.rental_staff_id = staff_rental.staff_id
    LEFT JOIN {{ ref('his_staff') }} AS staff_payment ON rpif.payment_staff_id = staff_payment.staff_id
    WHERE staff_rental.is_current = true and staff_payment.is_current = true
),
final_table AS (
    SELECT
        rpifsa.rental_id,
        rpifsa.rental_date,
        rpifsa.rental_customer_id,
        rpifsa.return_date,
        rpifsa.rental_staff_id,
        rpifsa.payment_id,
        rpifsa.payment_customer_id,
        rpifsa.payment_staff_id,
        rpifsa.amount,
        rpifsa.payment_date,
        rpifsa.store_id,
        rpifsa.film_id,
        rpifsa.rental_duration,
        rpifsa.rental_rate,
        rpifsa.replacement_cost,
        rpifsa.actor_id,
        rpifsa.customer_rental_address_id,
        rpifsa.customer_payment_address_id,
        rpifsa.staff_rental_address_id,
        rpifsa.staff_payment_address_id,
        store.address_id as store_address_id,
        GREATEST(rpifsa.last_update, store.valid_from) as last_update
    FROM rental_payment_inventory_film_staff_address AS rpifsa
    LEFT JOIN {{ ref('his_store') }} as store
    ON rpifsa.store_id = store.store_id
    WHERE store.is_current = true
)
SELECT * FROM final_table