with base AS (
SELECT 
    {{ dbt_utils.generate_surrogate_key(['vendorid', 'ratecodeid', 'pickup_datetime', 'dropoff_datetime', 'pickup_locationid', 'dropoff_locationid', 'taxi_type', 'store_and_fwd_flag', 'passenger_count', 'trip_distance', 'total_amount', 'payment_type']) }} as trip_id
    ,*
FROM {{ ref('int_trips_unioned') }}  
),

deduplication AS (
SELECT 
    * 
FROM base 
QUALIFY row_number() OVER(PARTITION BY trip_id ORDER BY pickup_datetime) = 1
)

SELECT * 
FROM deduplication