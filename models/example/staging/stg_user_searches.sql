{{ config(materialized='view') }}

SELECT
    user_id,
    created_at,
    last_uptdate,
FROM {{ source('raw', 'user_searches') }}

WHERE created_at >= last_uptdate
   

