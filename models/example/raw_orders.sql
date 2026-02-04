{{ config(materialized='table') }}

SELECT
    1 AS id,
    'Alexandre' AS Prenom,
    'De Caronnieres' AS Nom,
    20 AS Age,
    'Eugenia School' AS Ecole

UNION ALL

SELECT
    2 AS id,
    'Alexandre' AS Prenom,
    'Palmer' AS Nom,
    19 AS Age,
    'Eugenia School' AS Ecole

UNION ALL

SELECT
    3 AS id,
    'Nicolas' AS Prenom,
    'Shahata' AS Nom,
    19 AS Age,
    'Eugenia School' AS Ecole

UNION ALL

SELECT
    4 AS id,
    'Jonas' AS Prenom,
    'Lavigne' AS Nom,
    19 AS Age,
    'Eugenia School' AS Ecole