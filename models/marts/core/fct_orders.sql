with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

)

select
    order_id,
    customer_id,
    order_date,
    case 
        when payments.status = 'success' then amount
        else 0
    end as amount

from orders
    left join payments using (order_id)
