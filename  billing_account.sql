-- Añadir el campo billing_account_id a la tabla ivr_calls
ALTER TABLE keepcoding.ivr_calls
ADD COLUMN billing_account_id STRING;
-- Actualizar el campo billing_account_id en ivr_calls utilizando JOIN y GROUP BY
UPDATE keepcoding.ivr_calls c
SET c.billing_account_id = d.billing_account_id
FROM (
  SELECT
    calls_ivr_id,
    calls_phone_number,
    MAX(billing_account_id) AS billing_account_id
  FROM keepcoding.ivr_detail
  GROUP BY
    calls_ivr_id,
    calls_phone_number
) d
WHERE c.ivr_id = d.calls_ivr_id
  AND c.phone_number = d.calls_phone_number
  AND c.billing_account_id IS NULL;
 