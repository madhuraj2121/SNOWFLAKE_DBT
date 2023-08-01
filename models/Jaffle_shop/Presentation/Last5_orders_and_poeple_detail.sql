--1. Last 5 orders and correspoding poeple details. - Model (Required customer details and Order details)

{{
    config(
        materialized='table'    
    )
}}
select *
from {{ ref("Customers") }}  --reused Customers as reference
where most_recent_order_date is not null  --order date is comming hence filtered is as not null 
order by most_recent_order_date desc
limit 5   --limit as 5 
