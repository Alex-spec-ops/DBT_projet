{{ config(materialized='view') }}

SELECT
  id,
  user_id,
  created_at,
  origin,
  destination
FROM {{ source('raw', 'user_searches') }}
