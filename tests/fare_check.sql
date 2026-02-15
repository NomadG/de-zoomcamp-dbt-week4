SELECT 
    trip_id
    ,fare_amount
FROM {{ ref('fct_trips') }}
WHERE fare_amount < 0