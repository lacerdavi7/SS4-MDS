with Listings as (

    select id
            ,price
            ,minimum_nights
            ,number_of_reviews
            ,number_of_reviews_ltm
            ,reviews_per_month
            ,host_id
            ,latitude
            ,longitude
            ,host_name
            ,room_type
            ,neighbourhood_group
            ,neighbourhood
        from {{source('bq_airbnb','Raw_Listings')}}
)

select * from Listings