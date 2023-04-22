--4. Amount paid by customer for the 2nd order s/he placed.

with CTE as (
select s.customer_name, s.order_id,p.amount, row_number() 
        over (partition by customer_name order by s.customer_name ) as rnk
        from {{ ref('Success_Payment_status') }} s left join {{ ref('stg_strip_payment') }} p on s.customer_id = p.id ) 

select customer_name, order_id,amount
from CTE
where rnk = 2