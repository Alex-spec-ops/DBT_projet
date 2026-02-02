CREATE TABLE raw_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    customer_email VARCHAR(255),
    order_date VARCHAR(50),          -- date pas encore convertie
    order_amount VARCHAR(50),        -- montant en texte
    currency VARCHAR(10),
    payment_status VARCHAR(50),
    shipping_country VARCHAR(100),
    product_name VARCHAR(255),
    quantity VARCHAR(50),            -- quantité en texte
    discount_code VARCHAR(100),
    created_at VARCHAR(50)           -- timestamp brut
);
