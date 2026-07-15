{{
    config(
        materialized='view'
        )
}}


with src_hosts as (
    select * from {{ref('src_hosts')}}
)
select
HOST_ID,
NVL(HOST_NAME, 'N/A') as HOST_NAME,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT
from src_hosts