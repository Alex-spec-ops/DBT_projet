{{ config(materialized='table') }}

SELECT
    1 AS id,
    'Alexandre' AS Prenom,
    'De Carbonnieres' AS Nom,
    20  AS Age,
    'Eugenia School' AS Ecole


