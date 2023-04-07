with sales as (
    select * from "postgres"."public"."stg_sale"
),

dates as (
    select * from "postgres"."public"."stg_date"
),

final as (
    select
        row_number() over () as sale_id,
        d.year,
        d.month,
        d.qtr as quarter,
        sum(s.price_paid) as total_sales,
        sum(s.qty_sold) as total_tickets_sold,
        round(sum(s.price_paid) / sum(s.qty_sold), 2) as avg_tickit_sale_price,
        sum(s.commission) as total_commissions,
        sum(s.earnings) as total_earnings
    from 
        sales as s
            join dates as d on d.date_id = s.date_id
    group by
        d.year,
        d.month,
        d.qtr
    order by 
        d.year,
        d.month,
        d.qtr
)

select * from final;
