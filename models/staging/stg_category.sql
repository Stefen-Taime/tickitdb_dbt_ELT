WITH source AS (
  SELECT *
  FROM {{ ref('category') }}
),
renamed as (

    select
        catid as cat_id,
        catgroup as cat_group,
        catname as cat_name,
        catdesc as cat_desc
    from
        source
    where
        catid IS NOT NULL
    order by
        cat_id

)

select * from renamed
