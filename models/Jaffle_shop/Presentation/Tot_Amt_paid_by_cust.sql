--3 Total amount paid by each customer for the order placed.  

select s.customer_id, s.customer_name, sum(p.amount) as Tot_Amount
from {{ ref('Success_Payment_status') }} s join {{ ref('stg_strip_payment') }} p
on s.customer_id = p.id
group by s.customer_id,s.customer_name
order by s.customer_id