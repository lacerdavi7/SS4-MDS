with Reviews as (
    select listing_id
        from {{source('bq_airbnb','Raw_Reviews')}}
)

select * from Reviews