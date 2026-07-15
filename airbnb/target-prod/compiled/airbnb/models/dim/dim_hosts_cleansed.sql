


with  __dbt__cte__src_hosts as (
with raw_hosts as(
select * 
from AIRBNB.raw.raw_hosts
)
select 
ID as host_id, 
NAME as host_name,
IS_SUPERHOST, 
CREATED_AT, 
UPDATED_AT
from raw_hosts
), src_hosts as (
    select * from __dbt__cte__src_hosts
)
select
HOST_ID,
NVL(HOST_NAME, 'Anonymous') as HOST_NAME,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT
from src_hosts