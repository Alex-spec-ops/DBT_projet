{{ config(materialized='view') }}

SELECT
    id,
    first_name,
    last_name,
    email,
    created_at
    
FROM {{ source('raw', 'profiles') }}
