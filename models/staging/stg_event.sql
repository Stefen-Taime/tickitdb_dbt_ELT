WITH source AS (
    SELECT *
    FROM {{ ref('event') }}
),

renamed as (

    select
        eventid as event_id,
        venueid as venue_id,
        catid as cat_id,
        dateid as date_id,
        eventname as event_name,
        starttime as start_time
    from
        source
    where
        eventid IS NOT NULL
    order by
        event_id

)

select * from renamed