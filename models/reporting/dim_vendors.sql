with vendors AS (
SELECT DISTINCT vendorid AS vendorid
FROM {{ ref('int_trips_unioned') }}
)

SELECT 
    vendorid
    , {{ get_vendor_names('vendorid') }} AS vendor_names 
FROM vendors 