WITH source AS (
    SELECT *
    FROM {{ ref('venue') }}
),

renamed as (

    select
        venueid as venue_id,
        venuename as venue_name,
        venuecity as venue_city,
        venuestate as venue_state,
        venueseats as venue_seats
    from
        source
    where
        venueid IS NOT NULL
    order by
        venue_id
)

select * from renamed