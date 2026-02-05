-- Date Dimension Table
-- Generates all dates between 1900-01-01 and 2100-01-01

WITH final_date_range AS (
    SELECT
        TO_DATE('1900-01-01') as start_date,
        TO_DATE('2100-01-01') as end_date
),
date_spine AS (
    SELECT
        DATEADD(DAY, SEQ4(), start_date) as date_day
    FROM final_date_range,
        TABLE(GENERATOR(ROWCOUNT => 80000))
)

SELECT
    TO_CHAR(date_day, 'YYYYMMDD')::INT as date_key,
    date_day as date_actual,
    DAYOFWEEK(date_day) as day_of_week,
    DAYNAME(date_day) as day_name,
    DAY(date_day) as day_of_month,
    DAYOFYEAR(date_day) as day_of_year,
    WEEKOFYEAR(date_day) as week_of_year,
    DATE_TRUNC('WEEK', date_day) as week_start_date,
    MONTH(date_day) as month_number,
    MONTHNAME(date_day) as month_name,
    TO_CHAR(date_day, 'YYYY-MM') as month_year,
    DATE_TRUNC('MONTH', date_day) as month_start_date,
    LAST_DAY(date_day) as month_end_date,
    QUARTER(date_day) as quarter_number,
    'Q' || QUARTER(date_day) || '-' || YEAR(date_day) as quarter_year,
    DATE_TRUNC('QUARTER', date_day) as quarter_start_date,
    YEAR(date_day) as year_number,
    CASE WHEN DAYOFWEEK(date_day) IN (0, 6) THEN TRUE ELSE FALSE END as is_weekend,
    CASE WHEN DAYOFWEEK(date_day) NOT IN (0, 6) THEN TRUE ELSE FALSE END as is_weekday,
    DATEDIFF(DAY, DATE_TRUNC('YEAR', date_day), date_day) + 1 as day_of_year_number,
    DATEDIFF(WEEK, DATE_TRUNC('YEAR', date_day), date_day) + 1 as week_of_year_number,
    CURRENT_TIMESTAMP() as created_at
FROM date_spine
WHERE date_day <= (SELECT end_date FROM final_date_range)
ORDER BY date_day
