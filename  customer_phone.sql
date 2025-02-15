-- Añadir el campo customer_phone a la tabla ivr_calls
ALTER TABLE keepcoding.ivr_calls
ADD COLUMN customer_phone STRING;

UPDATE keepcoding.ivr_calls AS c
SET
  c.customer_phone = d.customer_phone
FROM
  keepcoding.ivr_detail AS d
WHERE
  c.ivr_id = d.calls_ivr_id
  AND c.phone_number = d.calls_phone_number;


