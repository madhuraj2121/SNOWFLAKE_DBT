--  1. How many orders placed in every individual year ?    


{{
    config(
        materialized='table'
    )
}}

with CTE as (
select distinct(MONTH(MOST_RECENT_ORDER_DATE)) as Month, Sum(NUMBER_OF_ORDERS) as Total_Orders_Placed
from {{ ref('Customers') }}
where Month is not null 
group by Month 
order by month)

select * from CTE 