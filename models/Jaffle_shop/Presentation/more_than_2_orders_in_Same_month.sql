--Any customer placed more than 15 orders in same year ? (> 15)


{{
    config(
        materialized='table'
    )
}}



--select user_id as customer_id, first_name from 
SELECT 
    o.user_id,c.first_name,
    month(o.order_date) AS order_month, 
    COUNT(*) AS order_count
FROM 
    {{ ref('Stg_Orders') }} o join {{ ref('stg_customers') }} c
    on o.user_id = c.id
GROUP BY 
    o.user_id,
    c.first_name,
     month(o.order_date)
HAVING 
    COUNT(*) >=2 