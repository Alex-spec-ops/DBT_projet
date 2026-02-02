CREATE TABLE staging.stg_orders AS

WITH cleaned AS (
    SELECT
        TRIM(order_id) AS order_id,
        TRIM(customer_id) AS customer_id,
        LOWER(TRIM(customer_email)) AS customer_email,

        -- Conversion des dates texte → timestamp
        CAST(order_date AS TIMESTAMP) AS order_date,

        -- Conversion montant texte → nombre
        CAST(order_amount AS NUMERIC) AS order_amount,

        UPPER(TRIM(currency)) AS currency,
        LOWER(TRIM(payment_status)) AS payment_status,
        INITCAP(TRIM(shipping_country)) AS shipping_country,

        TRIM(product_name) AS product_name,

        -- Quantité texte → entier
        CAST(quantity AS INTEGER) AS quantity,

        TRIM(discount_code) AS discount_code,

        CAST(created_at AS TIMESTAMP) AS created_at,

        -- Pour enlever les doublons (garder la ligne la plus récente)
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY CAST(created_at AS TIMESTAMP) DESC
        ) AS row_num

    FROM raw_orders
    WHERE order_id IS NOT NULL
)

SELECT *
FROM cleaned
WHERE row_num = 1              -- enlève les doublons
  AND order_amount > 0         -- enlève montants invalides
  AND quantity > 0;            -- enlève quantités invalides
