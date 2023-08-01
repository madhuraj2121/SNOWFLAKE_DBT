--1. Create individual model with payment type and orders placed using that payment type

select paymentmethod, count(orderid) as Tot_Order_Placed
from {{ ref('stg_strip_payment') }}
group by paymentmethod