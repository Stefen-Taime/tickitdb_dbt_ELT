WITH source AS (
    SELECT *
    FROM {{ ref('date') }}
),

renamed as (

    select
        dateid as date_id,
        caldate as cal_date,
        day,
        month,
        year,
        week,
        qtr,
        holiday
    from
        source
    where
        dateid IS NOT NULL
    order by
        date_id

)

select * from renamed