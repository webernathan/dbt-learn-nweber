with order_payments as (
    select order_id, sum(payment_amount) amount from {{ ref('stg_payments') }}
    where payment_status = 'success'
    group by order_id
),

customers as (
    select order_id, customer_id from {{ ref('stg_orders') }}
)

SELECT order_id, customer_id, amount from order_payments 
LEFT join customers USING (order_id) 

