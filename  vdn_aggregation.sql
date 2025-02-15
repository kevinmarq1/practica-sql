-- Actualizar calls_ivr_id con ivr_id convertido a INT64
UPDATE keepcoding.ivr_calls
SET calls_ivr_id = CAST(ivr_id AS INT64)
WHERE TRUE;

-- Actualizar vdn_aggregation con la lógica especificada
UPDATE keepcoding.ivr_calls
SET vdn_aggregation = CASE
    WHEN vdn_label LIKE 'ATC%' THEN 'FRONT'
    WHEN vdn_label LIKE 'TECH%' THEN 'TECH'
    WHEN vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
    ELSE 'RESTO'
END
WHERE TRUE;
