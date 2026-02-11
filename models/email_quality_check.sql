SELECT
  id,
  first_name,
  last_name,
  email,
  
  CASE
    WHEN LOWER(TRIM(email)) LIKE '%.om' THEN 'ends_with_.om'
    WHEN email IS NULL THEN 'null_email'
    WHEN NOT REGEXP_CONTAINS(
        LOWER(TRIM(email)),
        r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ) THEN 'invalid_format'
  END AS issue_type

FROM {{ source('raw', 'profiles') }}

WHERE
  LOWER(TRIM(email)) LIKE '%.om'
  OR email IS NULL
  OR NOT REGEXP_CONTAINS(
      LOWER(TRIM(email)),
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
  )
