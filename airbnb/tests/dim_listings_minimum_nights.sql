SELECT * FROM {{ ref ('dim_listings_cleansed')}}
WHERE minimum_nights < 1
LIMIT 10 -- limit number of records that go to the test failures