{{ config(materialized='view') }}

SELECT
    id,
    user_id,
    created_at,
    last_uptdate,
    origin,
    destination
FROM {{ source('raw', 'user_searches') }}

WHERE created_at <= last_uptdate
   OR last_uptdate IS NULL
