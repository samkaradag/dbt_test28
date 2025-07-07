with orders as (

    select *
    from {{ ref('stg_ecommerce__orders') }}

),

order_items as (

    select *
    from {{ ref('stg_ecommerce__order_items') }}

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        order_items.product_id,
        order_items.quantity,
        order_items.price_per_unit
    from
        orders
    left join
        order_items on orders.order_id = order_items.order_id

)

select * from final