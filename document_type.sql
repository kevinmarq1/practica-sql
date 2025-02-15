-- Añadir los campos document_type y document_identification a la tabla ivr_calls
ALTER TABLE keepcoding.ivr_calls
ADD COLUMN document_type STRING,
ADD COLUMN document_identification STRING;
-- Actualizar los campos document_type y document_identification en ivr_calls utilizando JOIN
UPDATE keepcoding.ivr_calls AS c
SET
  c.document_type = d.document_type,
  c.document_identification = d.document_identification
FROM
  keepcoding.ivr_detail AS d
WHERE
  c.ivr_id = d.calls_ivr_id
  AND c.phone_number = d.calls_phone_number;

