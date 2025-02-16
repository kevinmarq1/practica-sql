
ALTER TABLE keepcoding.ivr_calls
ADD COLUMN IF repeated_phone_24H,
ADD COLUMN IF cause_recall_phone_24H;
UPDATE keepcoding.ivr_calls c
SET repeated_phone_24H = (
  SELECT IF(COUNT(*) > 0, 1, 0)
  FROM keepcoding.ivr_detail d1
  JOIN keepcoding.ivr_detail d2
    ON d1.calls_phone_number = d2.calls_phone_number
  WHERE c.ivr_id = d1.calls_ivr_id
    AND d2.calls_start_date BETWEEN TIMESTAMP_SUB(d1.calls_start_date, INTERVAL 24 HOUR) AND d1.calls_start_date
    AND d1.calls_ivr_id != d2.calls_ivr_id
)
WHERE c.ivr_id IS NOT NULL;
UPDATE keepcoding.ivr_calls c
SET cause_recall_phone_24H = (
  SELECT IF(COUNT(*) > 0, 1, 0)
  FROM keepcoding.ivr_detail d1
  JOIN keepcoding.ivr_detail d2
    ON d1.calls_phone_number = d2.calls_phone_number
  WHERE c.ivr_id = d1.calls_ivr_id
    AND d2.calls_start_date BETWEEN d1.calls_start_date AND TIMESTAMP_ADD(d1.calls_start_date, INTERVAL 24 HOUR)
    AND d1.calls_ivr_id != d2.calls_ivr_id
)
WHERE c.ivr_id IS NOT NULL;