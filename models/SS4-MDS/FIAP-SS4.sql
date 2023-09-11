with FiapSS4 as (
    SELECT
        CAST(l.id AS INT64) AS id,
        CAST(l.price AS FLOAT64) AS price,
        CAST(l.minimum_nights AS INT64) AS minimum_nights,
        l.number_of_reviews,
        l.number_of_reviews_ltm,
        l.reviews_per_month,
        l.host_id,
        CAST(CONCAT(SUBSTR(REPLACE(l.latitude,'.',''),1,3),'.',
            SUBSTR(REPLACE(l.latitude,'.',''),4)) AS FLOAT64) AS latitude,
        CAST(CONCAT(SUBSTR(REPLACE(l.longitude,'.',''),1,3),'.',
            SUBSTR(REPLACE(l.longitude,'.',''),4)) AS FLOAT64) AS longitude,
        l.host_name,
        CASE
            WHEN l.room_type = 'Entire home/apt' THEN 'Acomodação Completa'
            WHEN l.room_type = 'Hotel room' THEN 'Quarto de Hotel'
            WHEN l.room_type = 'Private room' THEN 'Quarto Privado'
            WHEN l.room_type = 'Shared room' THEN 'Quarto Compartilhado'
        END AS Tipo_quarto,
        l.neighbourhood_group,
        l.neighbourhood,
        CASE
            WHEN CAST(l.minimum_nights AS INT64) > 30 THEN 'Longa duração'
            ELSE 'Turismo'
        END AS tipo_estadia,
        r.listing_id
    FROM
    {{ ref('raw_listings') }} AS l
    JOIN
    {{ ref('raw_reviews') }} AS r
    ON
    l.id = r.listing_id)

select * from FiapSS4