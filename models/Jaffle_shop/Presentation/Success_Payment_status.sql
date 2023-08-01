--2.1 Payment success model with Order and customer details. 

select o.customer_id, c.First_name as customer_name, o.order_id, p.Status as Transaction_Status
from {{ ref('stg_strip_payment') }} p inner join {{ ref('Stg_Orders') }} o
on p.id = o.customer_id join {{ ref('stg_customers') }} c
on o.customer_id=c.customer_id
where p.status = 'success' 
order by customer_id, order_id