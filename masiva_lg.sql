ALTER TABLE keepcoding.ivr_calls
ADD COLUMN masiva_lg INT64;
UPDATE keepcoding.ivr_calls c
SET masiva_lg = (
  SELECT IF(COUNT(*) > 0, 1, 0)
  FROM keepcoding.ivr_detail d
  WHERE c.ivr_id = d.calls_ivr_id
    AND CONTAINS_SUBSTR(d.calls_module_aggregation, 'AVERIA_MASIVA')
)
WHERE c.ivr_id IS NOT NULL;
