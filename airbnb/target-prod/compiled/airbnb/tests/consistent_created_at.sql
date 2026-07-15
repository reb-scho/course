SELECT 
    r.listing_id,
    r.review_date,
    l.created_at
FROM AIRBNB.PROD.fct_reviews r
INNER JOIN AIRBNB.PROD.dim_listings_cleansed l
ON r.listing_id = l.listing_id
WHERE r.review_date < l.created_at