WITH source AS (
    SELECT *
    FROM {{ ref('listing') }}
),

renamed as (

    select
        listid as list_id,
        sellerid as seller_id,
        eventid as event_id,
        dateid as date_id,
        numtickets as num_tickets,
        priceperticket as price_per_ticket,
        totalprice as total_price,
        listtime as list_time

    from
        source
    where
        listid IS NOT NULL
    order by
        list_id

)

select *  from renamed