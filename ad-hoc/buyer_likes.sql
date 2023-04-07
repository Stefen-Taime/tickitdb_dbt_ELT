with buyers as (
    select * from "postgres"."public"."user_sales_intermediate"
),

total_likes as (
    select
        sum(coalesce(cast(like_sports as integer), 0)) as sports,
        sum(coalesce(cast(like_theatre as integer), 0)) as theatre,
        sum(coalesce(cast(like_concerts as integer), 0)) as concerts,
        sum(coalesce(cast(like_jazz as integer), 0)) as jazz,
        sum(coalesce(cast(like_classical as integer), 0)) as classical,
        sum(coalesce(cast(like_opera as integer), 0)) as opera,
        sum(coalesce(cast(like_rock as integer), 0)) as rock,
        sum(coalesce(cast(like_vegas as integer), 0)) as vegas,
        sum(coalesce(cast(like_broadway as integer), 0)) as broadway,
        sum(coalesce(cast(like_musicals as integer), 0)) as musicals
    from
        buyers
),

final as (
    select
        row_number() over () as like_id,
        'sports' as event_type,
        sports as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'theatre' as event_type,
        theatre as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'concerts' as event_type,
        concerts as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'jazz' as event_type,
        jazz as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'classical' as event_type,
        classical as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'opera' as event_type,
        opera as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'rock' as event_type,
        rock as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'vegas' as event_type,
        vegas as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'broadway' as event_type,
        broadway as likes
    from
        total_likes
    union all
    select
        row_number() over () as like_id,
        'musicals' as event_type,
        musicals as likes
    from
        total_likes
)

select * from final;