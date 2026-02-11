{{ config(materialized='view') }}

SELECT
    id,
    created_at,
    updated_at,
    email,
    first_name,
    last_name
FROM {{ source('raw', 'profiles') }}
