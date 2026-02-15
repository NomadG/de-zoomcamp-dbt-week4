with yellow_trip AS (
    SELECT 
        *
    FROM {{ ref('stg_green_tripdata') }}
), 

green_trip AS (
    SELECT 
        *
    FROM {{ ref('stg_yellow_tripdata') }}
)

SELECT * 
FROM yellow_trip

UNION ALL 

SELECT *
FROM green_trip