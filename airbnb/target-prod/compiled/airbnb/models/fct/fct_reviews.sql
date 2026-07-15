

with  __dbt__cte__src_reviews as (
with raw_reviews as (
select *
from AIRBNB.raw.raw_reviews
)
select 
LISTING_ID,
DATE as review_date,
REVIEWER_NAME,
COMMENTS as review_text,
SENTIMENT as review_sentiment
from raw_reviews
), src_reviews as(
    select * from __dbt__cte__src_reviews  
)
    select 
     md5(cast(coalesce(cast(listing_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_date as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(reviewer_name as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(review_text as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT))
    AS review_id,  
    * from src_reviews
    where review_text   is not null

    
        
            AND review_date > (select max(review_date) from AIRBNB.PROD.fct_reviews)
            
        
    