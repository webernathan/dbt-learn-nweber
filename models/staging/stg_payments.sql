select
    id as payment_id,
    orderid as order_id,
    status as payment_status,
    amount / 100. as payment_amount,
    created as created_at
from raw.stripe.payment