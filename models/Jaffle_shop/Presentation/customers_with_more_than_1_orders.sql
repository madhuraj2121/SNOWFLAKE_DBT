select * from
{{ ref('Customers') }}
where number_of_orders > 1

